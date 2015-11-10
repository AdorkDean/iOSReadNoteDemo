//
//  ADeanAppDelegate+Method.m
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/11/10.
//  Copyright © 2015年 ADean. All rights reserved.
//

#import "ADeanAppDelegate+Method.h"

@implementation AppDelegate (Method)

+ (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

+ (void)closeKeyWindow
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}


@end
