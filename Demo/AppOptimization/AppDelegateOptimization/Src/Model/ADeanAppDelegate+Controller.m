//
//  ADeanAppDelegate+Controller.m
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/11/10.
//  Copyright © 2015年 ADean. All rights reserved.
//

#import <objc/runtime.h>

#import "ADeanAppDelegate+Controller.h"
#import "ADeanLoginLogic.h"
#import "ADeanUserInfoManager.h"

static const void *kLaunchVCObjectKey;
static const void *kLoginVCObjectKey;
static const void *kHelpVCObjectKey;


@implementation AppDelegate (UIViewController)

- (void)launchVCLogic {
    
    [self isUserLogin];
    [self hadEverLaunched];
    [self showLaunchView];
}


- (void)isUserLogin {
    if (![ADeanLoginLogic isUserLogin]) {
        [self.window addSubview:self.loginVC.view];
    }
}

- (void)hadEverLaunched {
    
    [ADeanUserInfoManager sharedManager].everLaunched = YES; // 展示效果
    if (![ADeanUserInfoManager sharedManager].everLaunched) {
        
        // 弹出引导页
        [ADeanUserInfoManager sharedManager].everLaunched = YES;
        [self.window addSubview:self.helpVC.view];
    }
}

- (void)showLaunchView {
    
//    [self.window addSubview:self.launchVC.view]; // 展示效果
//    sleep(2);
}



#pragma mark Init & Add
- (ADeanLaunchViewController *)launchVC
{
    ADeanLaunchViewController *launchVC = objc_getAssociatedObject(self, &kLaunchVCObjectKey);
    if (!launchVC)
    {
        launchVC = [[ADeanLaunchViewController alloc] init];
        objc_setAssociatedObject(self, &kLaunchVCObjectKey, launchVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return launchVC;
}
- (void)setLaunchVC:(ADeanLaunchViewController *)launchVC
{
    objc_setAssociatedObject(self, &kLaunchVCObjectKey, launchVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ADeanLoginViewController *)loginVC
{
    ADeanLoginViewController *loginVC = objc_getAssociatedObject(self, &kLoginVCObjectKey);
    if (!loginVC)
    {
        loginVC = [[ADeanLoginViewController alloc] init];
        objc_setAssociatedObject(self, &kLoginVCObjectKey, loginVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return loginVC;
}
- (void)setLoginVC:(ADeanLoginViewController *)loginVC
{
    objc_setAssociatedObject(self, &kLoginVCObjectKey, loginVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ADeanHelpViewController *)helpVC
{
    ADeanHelpViewController *helpVC = objc_getAssociatedObject(self, &kHelpVCObjectKey);
    if (!helpVC)
    {
        helpVC = [[ADeanHelpViewController alloc] init];
        objc_setAssociatedObject(self, &kHelpVCObjectKey, helpVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return helpVC;
}
- (void)setHelpVC:(ADeanHelpViewController *)helpVC
{
    objc_setAssociatedObject(self, &kHelpVCObjectKey, helpVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}




@end
