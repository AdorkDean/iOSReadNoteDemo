//
//  MiPushMessage.h
//  MiPushSDK
//
//  Created by shenyang on 14-7-23.
//  Copyright (c) 2014年 Xiaomi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MiPushMessage : NSObject

- (id)initWithTitle:(NSString*)title description:(NSString*)desciption;
- (void)setTTL:(NSTimeInterval)value;
- (void)addExtraItem:(NSString*)key value:(NSString*)value;

-(NSDictionary*)getMessage;

@end


@interface MiPushIOSMessage : MiPushMessage

/**
 * 通知 Icon上的标记
 */
- (void)setBadge:(int)value;

/**
 * 自定义通知声音
 */
- (void)setSound:(NSString*)value;

@end

@interface MiPushAndroidMessage : MiPushMessage

/**
 * 透传标记
 */
typedef enum {
    PASS_THROUGH_TYPE_NOTIFICATION = 0,
    PASS_THROUGH_TYPE_PASS = 1,
} PASS_THROUGH_TYPE;

/**
 * 通知类型. 声音, 震动, 提示灯. 可|组合
 */
typedef enum {
    NOTIFY_TYPE_ALL = -1,
    NOTIFY_TYPE_NONE = 0,
    NOTIFY_TYPE_SOUND = 1,
    NOTIFY_TYPE_VIBRATE = 2,
    NOTIFY_TYPE_LIGHTS = 4,
} NOTIFY_TYPE;

- (void)setCollapseKey:(NSString*)value;
- (void)setPayload:(NSString*)value;
- (void)setPassThrough:(PASS_THROUGH_TYPE)value;
- (void)setNotifyType:(NOTIFY_TYPE)value;
- (void)setRestrictedPackage:(NSString*)value;
- (void)setNotifyId:(int)value;

@end