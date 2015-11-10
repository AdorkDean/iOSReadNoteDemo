//
//  AppDelegate.m
//  AppDelegateOptimization
//
//  Created by adorkable dean on 14-5-22.
//  Copyright (c) 2014年 ADean. All rights reserved.
//

#import "AppDelegate.h"

#import "ADeanLaunchLogic.h"

#import "ADeanAppDelegate+Controller.h"
#import "ADeanAppDelegate+TabbarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate
#pragma mark
#pragma mark - System Action
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.rootViewController = self.tabbarController;
    [self.window makeKeyAndVisible];

    
    
    [self launchVCLogic];
    
    [ADeanLaunchLogic launchLogic];
    
    
    return YES;
}

- (UIWindow *)window
{
    if (!_window)
    {
        _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    }
    return _window;
}




@end
