//
//  NSArray+sk_safeArray.m
//  CategoryMethodCollections
//
//  Created by Bruce_Mac on 2020/5/10.
//  Copyright © 2020 SoulLink. All rights reserved.
//

#import "NSArray+sk_safeArray.h"
#import "NSObject+sk_swizzling.h"

@implementation NSArray(sk_safeArray)

+ (void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //NSArray的真身
        NSString *initStr = @"__NSArray0";
        NSString *singleStr = @"__NSSingleObjectArrayI";
        NSString *oneMoreStr = @"__NSArrayI";
        
        //替换数组的 objectAtIndex 方法
        NSString *tmpStr = @"objectAtIndex:";
        NSString *tmpZeroStr = @"safe_zeroObjectAtIndex:";
        NSString *tmpSingleStr = @"safe_singleObjectAtIndex:";
        NSString *tmpOneMoreStr = @"safe_objectAtIndex:";
        
        //替换数组的 objctAtIndexedSubscript 方法
        NSString *tmpSubscriptStr = @"objectAtIndexedSubscript:";
        NSString *tmpSafeSubscriptStr = @"safe_objectAtIndexedSubscript:";
        
        [NSObject sk_swizzleInstanceMethodWithSrcClass:NSClassFromString(initStr) srcSel:NSSelectorFromString(tmpStr) swizzledSel:NSSelectorFromString(tmpZeroStr)];
        [NSObject sk_swizzleInstanceMethodWithSrcClass:NSClassFromString(singleStr) srcSel:NSSelectorFromString(tmpStr) swizzledSel:NSSelectorFromString(tmpSingleStr)];
        [NSObject sk_swizzleInstanceMethodWithSrcClass:NSClassFromString(oneMoreStr) srcSel:NSSelectorFromString(tmpStr) swizzledSel:NSSelectorFromString(tmpOneMoreStr)];
        
        [NSObject sk_swizzleInstanceMethodWithSrcClass:NSClassFromString(oneMoreStr) srcSel:NSSelectorFromString(tmpSubscriptStr) swizzledSel:NSSelectorFromString(tmpSafeSubscriptStr)];
    });
}

/**
 取出NSArray 第index个 值 对应 __NSArray0
 @param index 索引 index
 @return 返回值
 */
- (id)safe_zeroObjectAtIndex:(NSUInteger)index {
    if (index >= self.count){
        NSLog(@"\n\n*********  crash warning  *********\n\n[__NSArray0 objectAtIndex:]: index %ld beyond bounds %@",index,self.count>0?[NSString stringWithFormat:@"[0 .. %ld]\n\n*********  warning end  *********\n\n",self.count-1]:@"bounds for empty array\n\n*********  warning end  *********\n\n");
        return nil;
    }
    return [self safe_zeroObjectAtIndex:index];
}

/**
 取出NSArray 第index个 值 对应 __NSSingleObjectArrayI
 
 @param index 索引 index
 @return 返回值
 */
- (id)safe_singleObjectAtIndex:(NSUInteger)index {
    if (index >= self.count){
        NSLog(@"\n\n*********  crash warning  *********\n\n[__NSSingleObjectArrayI objectAtIndex:]: index %ld beyond bounds %@",index,self.count>0?[NSString stringWithFormat:@"[0 .. %ld]\n\n*********  warning end  *********\n\n",self.count-1]:@"bounds for empty array\n\n*********  warning end  *********\n\n");
        return nil;
    }
    return [self safe_singleObjectAtIndex:index];
}

/**
 取出NSArray 第index个 值 对应 __NSArrayI
 
 @param index 索引 index
 @return 返回值
 */
- (id)safe_objectAtIndex:(NSUInteger)index {
    if (index >= self.count){
        NSLog(@"\n\n*********  crash warning  *********\n\n[__NSArrayI objectAtIndex:]: index %ld beyond bounds %@",index,self.count>0?[NSString stringWithFormat:@"[0 .. %ld]\n\n*********  warning end  *********\n\n",self.count-1]:@"bounds for empty array\n\n*********  warning end  *********\n\n");
        return nil;
    }
    return [self safe_objectAtIndex:index];
}

/**
 objectAtIndexedSubscript
 取出NSArray 第index个 值 对应 __NSArrayI
 
 @param index 索引 index
 @return 返回值
 */
- (id)safe_objectAtIndexedSubscript:(NSUInteger)index {
    
    if (index >= self.count){
        NSLog(@"\n\n*********  crash warning  *********\n\n[__NSArrayI objectAtIndex:]: index %ld beyond bounds %@\n\n*********  warning end  *********\n\n",index,self.count>0?[NSString stringWithFormat:@"[0 .. %ld]",self.count-1]:@"bounds for empty array\n\n*********  warning end  *********\n\n");
        return nil;
    }
    return [self safe_objectAtIndexedSubscript:index];
}

@end
