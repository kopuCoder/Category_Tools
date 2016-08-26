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
    
    
    
    //不可变数组为空时类型
    Method originArrayIndex = class_getInstanceMethod(NSClassFromString(@"__NSArray0"), @selector(objectAtIndex:));
    Method newArrayIndex = class_getInstanceMethod(NSClassFromString(@"__NSArray0"), @selector(kpEmptyObjectAtIndex:));
    if(originArrayIndex&&newArrayIndex){
        method_exchangeImplementations(originArrayIndex, newArrayIndex);
    }

    
    
    //不可变数组
    Method originArrayIndex1 = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
    Method newArrayIndex1 = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(kpObjectAtIndex:));
    if(originArrayIndex1&&newArrayIndex1){
        method_exchangeImplementations(originArrayIndex1, newArrayIndex1);
    }
    
    //可变数组
    Method originMutableArrayIndex = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndex:));
    Method newMutableArrayIndex = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(kpObjectAtIndexM:));
    if(originMutableArrayIndex&&newMutableArrayIndex){
        method_exchangeImplementations(originMutableArrayIndex, newMutableArrayIndex);
    }

}

- (id)kpEmptyObjectAtIndex:(NSUInteger)index{
    NSLog(@"ERROR:[__NSArray0 objectAtIndex:]: index %ld beyond bounds  for empty array",index);
    return nil;
}

/***  拦截不可变数组越界取值问题*/
- (id)kpObjectAtIndex:(NSUInteger)index{
    
    if(index >= self.count){
         NSLog(@"ERROR:[__NSArrayI objectAtIndex:]: index %ld beyond bounds %@",index,self.count>0?[NSString stringWithFormat:@"[0 .. %ld]",self.count-1]:@"bounds for empty array");
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
    NSLog(@"ERROR:[__NSArrayM objectAtIndex:]: index %ld beyond bounds %@",index,self.count>0?[NSString stringWithFormat:@"[0 .. %ld]",self.count-1]:@"bounds for empty array");
    return nil;
}

@end
