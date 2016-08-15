//
//  ViewController.m
//  XMGStatusBarHUDExample
//
//  Created by 李金钊 on 16/8/15.
//  Copyright © 2016年 lijinzhao. All rights reserved.
//

#import "ViewController.h"
#import "XMGStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success
{
    [XMGStatusBarHUD showSuccess:@"加载完成"];
}
- (IBAction)error
{
    [XMGStatusBarHUD showError:@"加载失败"];
}
- (IBAction)loading
{
    [XMGStatusBarHUD showLoading:@"正在加载..."];
}
- (IBAction)hide
{
    [XMGStatusBarHUD hide];
}

- (IBAction)message
{
    [XMGStatusBarHUD showMessage:@"显示相应的信息"];
}

@end
