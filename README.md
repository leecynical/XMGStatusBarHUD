# XMGStatusBarHUD
一个简单易用的状态栏指示器框架
## 显示成功信息
```objc
[XMGStatusBarHUD showSuccess:@"加载完成"];
```

## 显示失败信息
```objc
[XMGStatusBarHUD showError:@"加载失败"];
```

## 显示正在加载信息
```objc
[XMGStatusBarHUD showLoading:@"正在加载..."];
```

## 隐藏状态栏
```objc
[XMGStatusBarHUD hide];
```

## 显示自定义信息
```objc
[XMGStatusBarHUD showMessage:@"显示相应的信息"];
```