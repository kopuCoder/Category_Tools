//
//  NSNumber+CrashIntercept.h
//  CategoryMethodCollections
//
//  Created by 秦茂军 on 16/8/26.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  拦截NSNumber执行length操作--->第三方解析库可能会将后台给的字符串(全部是数字的时候)，转化成NSNumber，本地当做NSSTring处理时，特别是直接发动length消息时，最容易导致crahs,这只是一种保守的做法，最保险的做法则是对字符串发送length操作时，转化一遍，eg:[NSString stringWithFormat:@"%@",XXX];然后再取执行length操作--->预防编程思想
 */
@interface NSNumber(CrashIntercept)
//- (NSUInteger)length;
@end
