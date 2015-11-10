//
//  ADeanUserInfoManager.h
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/11/10.
//  Copyright © 2015年 ADean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADeanUserInfoManager : NSObject

@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userPassword;

@property (nonatomic, assign) BOOL everLaunched;


+ (instancetype)sharedManager;

@end
