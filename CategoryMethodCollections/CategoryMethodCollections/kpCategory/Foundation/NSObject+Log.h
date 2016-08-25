//
//  NSObjcet+Log.h
//  CategoryMethodCollections
//
//  Created by 秦茂军 on 16/8/26.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(Log)
/**
 *  根据服务器返回的json，快捷打印出属性，生成如：@property (nonatomic,copy)NSString * <#name#>;类似的字符串
 */
+ (void)printPropertyWithDict:(NSDictionary *)dict;


@end
