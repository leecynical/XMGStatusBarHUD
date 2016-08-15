//
//  XMGStatusBarHUD.m
//  XMGStatusBarHUD
//
//  Created by 李金钊 on 16/8/13.
//  Copyright © 2016年 lijinzhao. All rights reserved.
//

#import "XMGStatusBarHUD.h"
#define XMGMessageFont [UIFont systemFontOfSize:12]
static CGFloat const XMGMessageDuration = 2.0;
static CGFloat const XMGAnimationDuration = 0.25;

@implementation XMGStatusBarHUD
static UIWindow *window_;
static NSTimer *timer_;

+(void)showWindow
{
    CGFloat windowH = 20;
    CGRect windowFrame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.hidden = NO;
    window_.frame = windowFrame;
    window_.backgroundColor = [UIColor redColor];
    window_.windowLevel = UIWindowLevelAlert;
    //window出现的动画
    windowFrame.origin.y = 0;
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        window_.frame = windowFrame;
    }];
}

+(void)showMessage:(NSString *)msg image:(UIImage *)image
{
    [timer_ invalidate];
    
    [self showWindow];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:msg forState:UIControlStateNormal];
    btn.titleLabel.font = XMGMessageFont;
    
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    btn.frame = window_.bounds;
    [window_ addSubview:btn];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:XMGMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+(void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}

+(void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"XMGStatusBarHUD.bundle/check"]];
}

+(void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"XMGStatusBarHUD.bundle/error"]];
}

+(void)showLoading:(NSString *)msg
{
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindow];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = window_.bounds;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = XMGMessageFont;
    label.text = msg;
    
    [window_ addSubview:label];
    
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    CGFloat loadingViewPadding = 20;
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : XMGMessageFont}].width;
    CGFloat loadingViewCenterX = (window_.frame.size.width - msgW) * 0.5 - loadingViewPadding;
    CGFloat loadingViewCenterY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(loadingViewCenterX, loadingViewCenterY);
    [window_ addSubview:loadingView];
}

+(void)hide
{
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        CGRect windowFrame = window_.frame;
        windowFrame.origin.y -= windowFrame.size.height;
        window_.frame = windowFrame;
    } completion:^(BOOL finished) {
        timer_ = nil;
        //window_.hidden = YES;
        window_ = nil;
    }];
}
@end
