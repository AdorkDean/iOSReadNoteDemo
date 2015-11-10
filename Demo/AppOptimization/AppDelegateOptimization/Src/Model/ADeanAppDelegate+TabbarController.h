//
//  ADeanAppDelegate+TabbarController.h
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/11/10.
//  Copyright © 2015年 ADean. All rights reserved.
//

//  对外开放的函数操作

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ADeanMainViewController.h"

@interface AppDelegate (UITabbarController)

@property (nonatomic, strong) ADeanMainViewController *tabbarController;


- (void)launchVCLogic;

@end
