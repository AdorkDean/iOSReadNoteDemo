//
//  ADeanLoginLogic.m
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/11/10.
//  Copyright © 2015年 ADean. All rights reserved.
//

#import "ADeanLoginLogic.h"
#import "ADeanUserInfoManager.h"

@implementation ADeanLoginLogic

+ (BOOL)isUserLogin {
    
    [ADeanUserInfoManager sharedManager].isLogin = YES;// 展示效果
    
    if (!([ADeanUserInfoManager sharedManager].userName != nil &&
          [ADeanUserInfoManager sharedManager].userName.length > 0 &&
          [ADeanUserInfoManager sharedManager].userPassword != nil &&
          [ADeanUserInfoManager sharedManager].userPassword.length > 0)) {
        
        // 用户名、密码、手势密码为空时候强制为未登录
        [ADeanUserInfoManager sharedManager].isLogin = NO;
    }

    
    return [ADeanUserInfoManager sharedManager].isLogin;
}
+ (BOOL)isNeedAutoLogin {
    return YES;
}

@end
