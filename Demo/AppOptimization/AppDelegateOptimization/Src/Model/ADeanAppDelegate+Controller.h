//
//  ADeanAppDelegate+Controller.h
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/11/10.
//  Copyright © 2015年 ADean. All rights reserved.
//

//  对外开放的函数操作

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

#import "ADeanLoginViewController.h"
#import "ADeanLaunchViewController.h"
#import "ADeanHelpViewController.h"

@interface AppDelegate (UIViewController)

@property (nonatomic, strong) ADeanLaunchViewController *launchVC;
@property (nonatomic, strong) ADeanLoginViewController *loginVC;
@property (nonatomic, strong) ADeanHelpViewController *helpVC;


- (void)launchVCLogic;

@end
