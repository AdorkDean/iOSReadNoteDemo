//
//  ADeanLaunchLogic.m
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/11/10.
//  Copyright © 2015年 ADean. All rights reserved.
//

#import "ADeanLaunchLogic.h"

@implementation ADeanLaunchLogic

+ (void)launchLogic {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 基本生成
        [self generateDatabase];
        [self generateFolders];
        [self generateFiles];
        
        // 基本检查
        if (![self appIntegrity] || ![self isJailed]) {
            // 提示用户应用安全性
        }
    });
}

+ (void)generateDatabase {
    // 生成数据库
}

+ (void)generateFolders {
    // 生成文件夹
}

+ (void)generateFiles {
    // 生成必要的文件
}

+ (BOOL)appIntegrity {
    
    // 检查App包的完整性
    return YES;
}
+ (BOOL)isJailed {
    return YES;
}

@end
