//
//  NSMutableArray+sk_safeArray.m
//  CategoryMethodCollections
//
//  Created by Bruce_Mac on 2020/5/10.
//  Copyright © 2020 SoulLink. All rights reserved.
//

#import "NSMutableArray+sk_safeArray.h"
#import "NSObject+sk_swizzling.h"

@implementation NSMutableArray(sk_safeArray)

+ (void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //NSArray的真身
        NSString *beyondMoreStr = @"__NSArrayM";
        
        //替换数组的 objectAtIndex 方法
        NSString *tmpStr = @"objectAtIndex:";
        NSString *tmpZeroStr = @"safe_zeroObjectAtIndex:";
        NSString *tmpSingleStr = @"safe_singleObjectAtIndex:";
        NSString *tmpOneMoreStr = @"safe_objectAtIndex:";
        
        //替换数组的 objctAtIndexedSubscript 方法
        NSString *tmpSubscriptStr = @"objectAtIndexedSubscript:";
        NSString *tmpSafeSubscriptStr = @"safe_objectAtIndexedSubscript:";
        
        [NSObject sk_swizzleInstanceMethodWithSrcClass:NSClassFromString(beyondMoreStr) srcSel:NSSelectorFromString(tmpSubscriptStr) swizzledSel:NSSelectorFromString(tmpSafeSubscriptStr)];
        
        [NSObject sk_swizzleInstanceMethodWithSrcClass:NSClassFromString(beyondMoreStr) srcSel:NSSelectorFromString(tmpStr) swizzledSel:NSSelectorFromString(tmpZeroStr)];
        [NSObject sk_swizzleInstanceMethodWithSrcClass:NSClassFromString(beyondMoreStr) srcSel:NSSelectorFromString(tmpStr) swizzledSel:NSSelectorFromString(tmpSingleStr)];
        [NSObject sk_swizzleInstanceMethodWithSrcClass:NSClassFromString(beyondMoreStr) srcSel:NSSelectorFromString(tmpStr) swizzledSel:NSSelectorFromString(tmpOneMoreStr)];
    });
}

/**
 @param index 索引 index
 @return 返回值
 */
- (id)safe_zeroObjectAtIndex:(NSUInteger)index {
    
    if (index >= self.count){
        NSLog(@"\n\n*********  crash warning  *********\n\n[__NSArrayM objectAtIndex:]: index %ld beyond bounds %@\n\n*********  warning end  *********\n\n",index,self.count>0?[NSString stringWithFormat:@"[0 .. %ld]",self.count-1]:@"bounds for empty array\n\n*********  warning end  *********\n\n");
        return nil;
    }
    return [self safe_zeroObjectAtIndex:index];
}

/**
 @param index 索引 index
 @return 返回值
 */
- (id)safe_singleObjectAtIndex:(NSUInteger)index {
    if (index >= self.count){
        NSLog(@"\n\n*********  crash warning  *********\n\n[__NSArrayM objectAtIndex:]: index %ld beyond bounds %@\n\n*********  warning end  *********\n\n",index,self.count>0?[NSString stringWithFormat:@"[0 .. %ld]",self.count-1]:@"bounds for empty array\n\n*********  warning end  *********\n\n");
        return nil;
    }
    return [self safe_singleObjectAtIndex:index];
}

/**
 @param index 索引 index
 @return 返回值
 */
- (id)safe_objectAtIndex:(NSUInteger)index {
    if (index >= self.count){
        NSLog(@"\n\n*********  crash warning  *********\n\n[__NSArrayM objectAtIndex:]: index %ld beyond bounds %@\n\n*********  warning end  *********\n\n",index,self.count>0?[NSString stringWithFormat:@"[0 .. %ld]",self.count-1]:@"bounds for empty array\n\n*********  warning end  *********\n\n");
        return nil;
    }
    return [self safe_objectAtIndex:index];
}

/**
 objectAtIndexedSubscript
 @param index 索引 index
 @return 返回值
 */
- (id)safe_objectAtIndexedSubscript:(NSUInteger)index {
    
    if (index >= self.count){
        NSLog(@"\n\n*********  crash warning  *********\n\n[__NSArrayM objectAtIndex:]: index %ld beyond bounds %@\n\n*********  warning end  *********\n\n",index,self.count>0?[NSString stringWithFormat:@"[0 .. %ld]",self.count-1]:@"bounds for empty array\n\n*********  warning end  *********\n\n");
        return nil;
    }
    return [self safe_objectAtIndexedSubscript:index];
}

@end
