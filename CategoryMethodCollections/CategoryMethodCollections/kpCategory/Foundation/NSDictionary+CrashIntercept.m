//
//  NSDictionary+CrashIntercept.m
//  CategoryMethodCollections
//
//  Created by 秦茂军 on 16/8/26.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//
#import "NSDictionary+CrashIntercept.h"
#import <objc/message.h>
@implementation NSDictionary(CrashIntercept)
+ (void)load{
    
    Method originalMethod1 = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(removeObjectForKey:));
    Method newMethod1 = class_getInstanceMethod(self, @selector(kpRemoveObjectForKey:));
    
    if (originalMethod1 &&newMethod1) {
        method_exchangeImplementations(originalMethod1, newMethod1);
    }
    
    
    Method originalMethod2 = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(setObject:forKey:));
    Method newMethod2 = class_getInstanceMethod(self, @selector(kpSetObject:forKey:));

    if (originalMethod2 &&newMethod2) {
        method_exchangeImplementations(originalMethod2, newMethod2);
    }
    
}


/**拦截字典设置值时，key或者value为nil的情况*/
- (void)kpSetObject:(id)anObject forKey:(id)aKey{
    if (aKey!=nil) {
        [self kpSetObject:anObject forKey:aKey];
    }
    else{
        NSLog(@"ERROR:[__NSDictionaryM setObjectForKey:]: key cannot be nil<---->value:%@",anObject);
        return;
    }
    
    if(anObject&&aKey){
        [self kpSetObject:anObject forKey:aKey];
    }else{
        NSLog(@"ERROR:字典存在key:%@<------>value为nil",aKey);
    }
}

/**拦截通过可定key删除字典中的值时，传入key为nil的情况*/
- (void)kpRemoveObjectForKey:(id)aKey{
    
    if(aKey){
        [self kpRemoveObjectForKey:aKey];
    }else{
        NSLog(@"ERROR:[__NSDictionaryM removeObjectForKey:]: key cannot be nil");
    }
}




@end
