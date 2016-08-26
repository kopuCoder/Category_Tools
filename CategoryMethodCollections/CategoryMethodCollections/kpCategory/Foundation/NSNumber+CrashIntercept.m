//
//  NSNumber+CrashIntercept.m
//  CategoryMethodCollections
//
//  Created by 秦茂军 on 16/8/26.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "NSNumber+CrashIntercept.h"
#import <objc/message.h>

@implementation NSNumber(CrashIntercept)

 NSUInteger length(id self, SEL _cmd)
{
    NSLog(@"ERROR:-[__NSCFNumber length]: unrecognized selector sent to instance");
//    return [[NSString stringWithFormat:@"%@",self] length];
    return 0;
}

+ (void)load{
        Class currentClass =  NSClassFromString(@"__NSCFNumber");
        Method  lengthMethod = class_getInstanceMethod(currentClass, @selector(length));
        if(!lengthMethod){
            class_addMethod(currentClass, @selector(length), (IMP)length, "i@:");
        }
}




@end
