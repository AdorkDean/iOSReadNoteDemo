//
//  ADeanMethodSwizzling.m
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/6/17.
//  Copyright (c) 2015年 ADean. All rights reserved.
//

#import "ADeanMethodSwizzling.h"
#import <objc/runtime.h>
NSDictionary *GetPropertyListOfClass(Class cls);
//根据类名称获取类
//系统就提供 NSClassFromString(NSString *clsname)

//获取一个类的所有属性名字:类型的名字，具有@property的, 父类的获取不了！
NSDictionary *GetPropertyListOfObject(NSObject *object)
{
    return GetPropertyListOfClass([object class]);
}

NSDictionary *GetPropertyListOfClass(Class cls){
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(cls, &outCount);
    for(i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        const char *propType = property_getAttributes(property);
        if(propType&&propName)
        {
            NSArray *anAttribute = [[NSString stringWithUTF8String:propType]componentsSeparatedByString:@","];
            NSString *aType = anAttribute[0];
            [dict setObject:aType forKey:[NSString stringWithUTF8String:propName]];
        }
    }
    free(properties);
    
    return dict;
}

//静态就交换静态，实例方法就交换实例方法
void SwizzlingMethod(Class class, SEL originSEL, SEL swizzledSEL)
{
    Method originMethod = class_getInstanceMethod(class, originSEL);
    Method swizzledMethod = nil;
    
	if (!originMethod)
    {// 处理为类方法
		originMethod = class_getClassMethod(class, originSEL);
        if (!originMethod)
        {
            return;
        }
        swizzledMethod = class_getClassMethod(class, swizzledSEL);
        if (!swizzledMethod)
        {
            return;
        }
    }
    else
    {// 处理实例方法
        swizzledMethod = class_getInstanceMethod(class, swizzledSEL);
        if (!swizzledMethod)
        {
            return;
        }
    }
    
    if(class_addMethod(class, originSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod)))
    { //自身已经有了就添加不成功，直接交换即可
        class_replaceMethod(class, swizzledSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }
    else
    {
        method_exchangeImplementations(originMethod, swizzledMethod);
	}
}