//
//  NSObjcet+Log.m
//  CategoryMethodCollections
//
//  Created by 秦茂军 on 16/8/26.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "NSObject+Log.h"

@implementation NSObject(Log)
// 自动打印属性字符串
+ (void)printPropertyWithDict:(NSDictionary *)dict{
    
    // 拼接属性字符串代码
    NSMutableString *strM = [NSMutableString string];
    
    // 1.遍历字典，把字典中的所有key取出来，生成对应的属性代码
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        // 类型经常变，抽出来
        NSString *type;
        
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            type = @"NSString";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]){
            type = @"NSArray";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
            type = @"NSInteger";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]){
            type = @"NSDictionary";
        }
        
        // 属性字符串
        NSString *str;
        if ([type containsString:@"NS"]) {
            str = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@;",type,key];
        }else{
            str = [NSString stringWithFormat:@"@property (nonatomic, assign) %@ %@;",type,key];
        }
        
        // 每生成属性字符串，就自动换行。
        [strM appendFormat:@"\n%@\n",str];
        
    }];
    
    // 把拼接好的字符串打印出来，就好了。
    NSLog(@"%@",strM);
    
}

@end
