//
//  NSObject+sk_swizzling.h
//  CategoryMethodCollections
//
//  Created by Bruce_Mac on 2020/5/10.
//  Copyright © 2020 SoulLink. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject(sk_swizzling)

/**
 交换两个对象方法的实现
 
 @param srcClass 被替换方法的类
 @param srcSel 被替换的方法编号
 @param swizzledSel 用于替换的方法编号
 */
+ (void)sk_swizzleInstanceMethodWithSrcClass:(Class)srcClass
                                      srcSel:(SEL)srcSel
                                 swizzledSel:(SEL)swizzledSel;
@end

NS_ASSUME_NONNULL_END
