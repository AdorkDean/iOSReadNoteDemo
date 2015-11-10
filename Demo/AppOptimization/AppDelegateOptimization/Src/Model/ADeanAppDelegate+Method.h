//
//  ADeanAppDelegate+Method.h
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/11/10.
//  Copyright © 2015年 ADean. All rights reserved.
//

//  对外开放的函数操作

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface AppDelegate (Method)

/*!
 @brief 全局appDeleaget
 */
+ (AppDelegate *)appDelegate;

/*!
 @method
 @brief 关闭系统键盘
 */
+ (void)closeKeyWindow;

@end
