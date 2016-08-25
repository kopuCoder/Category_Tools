//
//  NSArray+CacheIntercept.m
//  LoanPro
//
//  Created by 秦茂军 on 16/8/25.
//  Copyright © 2016年 haodai. All rights reserved.
//

#import "NSArray+CrashIntercept.h"
#import <objc/message.h>
@implementation NSArray(CrashIntercept)

+ (void)load{
    //不可变数组
    Method originArrayIndex = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
    Method newArrayIndex = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(kpObjectAtIndex:));
    if(originArrayIndex&&newArrayIndex){
        method_exchangeImplementations(originArrayIndex, newArrayIndex);
    }
    
    //可变数组
    Method originMutableArrayIndex = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndex:));
    Method newMutableArrayIndex = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(kpObjectAtIndexM:));
    if(originMutableArrayIndex&&newMutableArrayIndex){
        method_exchangeImplementations(originMutableArrayIndex, newMutableArrayIndex);
    }

}

/***  拦截不可变数组越界取值问题*/
- (id)kpObjectAtIndex:(NSUInteger)index{
    
    if(index >= self.count){
        NSLog(@"ERROR:不可变数组取值index:%ld 越界",index);
        return nil;
    }else{
        return [self kpObjectAtIndex:index];
    }
}

/***  拦截可变数组越界取值问题*/
- (id)kpObjectAtIndexM:(NSUInteger)index{
    if (index<self.count) {
        return [self kpObjectAtIndexM:index];
    }
    NSLog(@"ERROR:可变数组取值index:%ld越界",index);
    return nil;
}

@end
