//
//  ADeanAppDelegate+TabbarController.m
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/11/10.
//  Copyright © 2015年 ADean. All rights reserved.
//

#import <objc/runtime.h>

#import "ADeanAppDelegate+TabbarController.h"

static const void *kTabbarVCObjectKey;

@implementation AppDelegate (UIViewController)


#pragma mark Init & Add
- (ADeanMainViewController *)tabbarController
{
    ADeanMainViewController *tabbarController = objc_getAssociatedObject(self, &kTabbarVCObjectKey);
    if (!tabbarController)
    {
        tabbarController = [[ADeanMainViewController alloc] init];
        objc_setAssociatedObject(self, &kTabbarVCObjectKey, tabbarController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return tabbarController;
}
- (void)setTabbarController:(ADeanMainViewController *)tabbarController
{
    objc_setAssociatedObject(self, &kTabbarVCObjectKey, tabbarController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
