//
//  MiPushServerSDK.h
//  MiPushServerSDK
//
//  Created by shenyang on 14-7-18.
//  Copyright (c) 2014年 Xiaomi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MiPushServerSDKDelegate <NSObject>

@optional
- (void)miPushServerSendWithResult:(int)result data:(NSDictionary *)data;
- (void)miPushServerStatsWithResult:(int)result data:(NSDictionary *)data;

@end

@class MiPushMessage;
@interface MiPushServerSDK : NSObject

/**
 * 注册并开启Server功能
 */
+ (void)registerMiPushServer:(id<MiPushServerSDKDelegate>)delegate;

/**
 * 发送
 */
+ (void)sendWithRegid:(NSString*)regid message:(MiPushMessage*)message;
+ (void)sendWithRegids:(NSArray*)list message:(MiPushMessage*)message;
+ (void)sendWithAlias:(NSString*)alias message:(MiPushMessage*)message;
+ (void)sendWithAliases:(NSArray*)list message:(MiPushMessage*)message;
+ (void)sendWithTopic:(NSString*)topic message:(MiPushMessage*)message;

/**
 * 获取发送结果, 尽在正式环境下可用. 
 */
+ (void)getSendStatsWithStart:(NSString*)start end:(NSString*)end;

@end
