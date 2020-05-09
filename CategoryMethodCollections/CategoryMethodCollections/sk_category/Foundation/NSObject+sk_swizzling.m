//
//  NSObject+sk_swizzling.m
//  CategoryMethodCollections
//
//  Created by Bruce_Mac on 2020/5/10.
//  Copyright © 2020 SoulLink. All rights reserved.
//

#import "NSObject+sk_swizzling.h"
#import <objc/runtime.h>

@implementation NSObject(sk_swizzling)

/**
 交换两个对象方法的实现
 
 @param srcClass 被替换方法的类
 @param srcSel 被替换的方法编号
 @param swizzledSel 用于替换的方法编号
 */
+ (void)sk_swizzleInstanceMethodWithSrcClass:(Class)srcClass
                                      srcSel:(SEL)srcSel
                                 swizzledSel:(SEL)swizzledSel{
    
    Method srcMethod = class_getInstanceMethod(srcClass, srcSel);
    Method swizzledMethod = class_getInstanceMethod(srcClass, swizzledSel);
    if (!srcClass || !srcMethod || !swizzledMethod) return;
//加一层保护措施，如果添加成功，则表示该方法不存在于本类，而是存在于父类中，不能交换父类的方法,否则父类的对象调用该方法会crash；添加失败则表示本类存在该方法
    BOOL addMethod = class_addMethod(srcClass, srcSel, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (addMethod){
        //添加方法实现IMP成功后，再将原有的实现替换到swizzledMethod方法上，从而实现方法的交换，并且未影响到父类方法的实现
        class_replaceMethod(srcClass, swizzledSel, method_getImplementation(srcMethod), method_getTypeEncoding(srcMethod));
    }else{
        //添加失败，调用交互两个方法的实现
        method_exchangeImplementations(srcMethod, swizzledMethod);
    }
}

@end
