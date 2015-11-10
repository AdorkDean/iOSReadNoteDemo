//
//  ADeanUserInfoManager.m
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/11/10.
//  Copyright © 2015年 ADean. All rights reserved.
//

#import "ADeanUserInfoManager.h"

static ADeanUserInfoManager *staticUserDataManager;


@implementation ADeanUserInfoManager



+ (instancetype)sharedManager
{
    if (!staticUserDataManager){
        static dispatch_once_t token ;
        dispatch_once(&token, ^{
            staticUserDataManager = [[ADeanUserInfoManager alloc] init];
        });
    }
    return staticUserDataManager;
}


@end

