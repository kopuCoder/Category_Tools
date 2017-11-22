//
//  DeviceUtils.h
//  templateProject
//
//  Created by Bruce Chin on 2017/8/7.
//  Copyright © 2017年 Bruce Chin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceUtils : NSObject

+ (NSString * ) getDeviceUUID;
/**获取广告标识,不太建议使用，可能是一串0*/
+ (NSString *)getDeviceIDFA;

+ (NSString * ) getDeviceUserName;

+ (NSString * ) getDeviceSystemName;

+ (NSString * ) getDeviceVersion;

+ (NSString * ) getDeviceModel;

+ (NSString * ) getDeviceLocalModel;

+ (NSString * ) getAppName;

+ (NSString * ) getAppVersion;

+ (NSString * ) getAppVersionNum;

+ (NSString * ) getAppInfo;

/**获取手机型号 eg:g:iPhone8 Plus*/
+ (NSString *) getDeviceModelName;

//获取本机运营商名称
+ (NSString *)getCurrentDeviceOperators;

/**获取当前设备 IMSI*/
+ (NSString *)getCurrentDeviceIMSI;

/**获取分辨率*/
+ (NSString *)getCurrentDeviceScale;

@end
