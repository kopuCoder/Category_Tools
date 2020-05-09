//
//  DeviceUtils.m
//  templateProject
//
//  Created by Bruce Chin on 2017/8/7.
//  Copyright © 2017年 Bruce Chin. All rights reserved.
//
#import "DeviceUtils.h"
#import <UIKit/UIKit.h>
#import "sys/utsname.h"
#import <AdSupport/AdSupport.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import "CHKeychain.h"

NSString * const UUIDKEY = @"C6846nK6775s0sT";
NSString * const IDFAKEY = @"C8899nK1774s0sT";

@implementation DeviceUtils


+ (NSString * ) getDeviceUUID{
    
    NSString * cacheUUID = [CHKeychain load:UUIDKEY];
    if(cacheUUID.length >0 ){
        NSLog(@"缓存的UUID===>%@",cacheUUID);
        return cacheUUID;
    }
    
    NSString * uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    uuid = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    [CHKeychain save:UUIDKEY data:uuid];
    return uuid;
}

+ (NSString *)getDeviceIDFA{
    
    NSString * cacheIDFA = [CHKeychain load:IDFAKEY];
    if(cacheIDFA.length >0 ){
        NSLog(@"缓存的IDFA===>%@",cacheIDFA);
        return cacheIDFA;
    }
    
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    idfa = [idfa stringByReplacingOccurrencesOfString:@"-" withString:@""];
    idfa = [idfa stringByReplacingOccurrencesOfString:@"0" withString:@""];
    if(idfa.length >0){
        [CHKeychain save:IDFAKEY data:idfa];
    }
    return idfa.length >0?idfa:@"";
}


+ (NSString * ) getDeviceUserName{
    
    return [[UIDevice currentDevice] name];
}

+ (NSString * ) getDeviceSystemName{
    
    return [[UIDevice currentDevice] systemName];
}

+ (NSString * ) getDeviceVersion{
    
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString * ) getDeviceModel{
    
    return [[UIDevice currentDevice] model];
}

+ (NSString * ) getDeviceLocalModel{
    
    return [[UIDevice currentDevice] localizedModel];
}

+ (NSString * ) getAppName{
    
    NSDictionary * infoDic = [[NSBundle mainBundle] infoDictionary];
    return [infoDic objectForKey:@"CFBundleDisplayName"];
}

+ (NSString * ) getAppVersion{
    
    NSDictionary * infoDic = [[NSBundle mainBundle] infoDictionary];
    return [infoDic objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString * ) getAppVersionNum{
    
    NSDictionary * infoDic = [[NSBundle mainBundle] infoDictionary];
    return [infoDic objectForKey:@"CFBundleShortVersionString"];
}

+(NSString * ) getAppInfo{
    return [[[NSBundle mainBundle] infoDictionary] description];
}

+ (NSString *)getDeviceModelName {
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    
    if ([deviceString isEqualToString:@"iPhone10,1"])    return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,4"])    return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,2"])    return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,5"])    return @"iPhone 8 Plus";
    
    if ([deviceString isEqualToString:@"iPhone10,3"])    return @"iPhone X";
    if ([deviceString isEqualToString:@"iPhone10,6"])    return @"iPhone X";
    
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    //iPad
    if ([deviceString isEqualToString:@"iPad1,1"])    return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])    return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,2"])    return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,3"])    return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,4"])    return @"iPad 2";
    
    if ([deviceString isEqualToString:@"iPad3,1"])    return @"iPad (3rd generation)";
    if ([deviceString isEqualToString:@"iPad3,2"])    return @"iPad (3rd generation)";
    if ([deviceString isEqualToString:@"iPad3,3"])    return @"iPad (3rd generation)";
    
    if ([deviceString isEqualToString:@"iPad3,4"])    return @"iPad (4rd generation)";
    if ([deviceString isEqualToString:@"iPad3,5"])    return @"iPad (4rd generation)";
    if ([deviceString isEqualToString:@"iPad3,6"])    return @"iPad (4rd generation)";
    
    if ([deviceString isEqualToString:@"iPad4,1"])    return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,2"])    return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,3"])    return @"iPad Air";
    
    if ([deviceString isEqualToString:@"iPad5,3"])    return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])    return @"iPad Air 2";
    
    if ([deviceString isEqualToString:@"iPad6,7"])    return @"iPad Pro (12.9-inch)";
    if ([deviceString isEqualToString:@"iPad6,8"])    return @"iPad Pro (12.9-inch)";
    
    if ([deviceString isEqualToString:@"iPad6,3"])    return @"iPad Pro (9.7-inch)";
    if ([deviceString isEqualToString:@"iPad6,4"])    return @"iPad Pro (9.7-inch)";
    
    if ([deviceString isEqualToString:@"iPad6,11"])    return @"iPad (5th generation)";
    if ([deviceString isEqualToString:@"iPad6,12"])    return @"iPad (5th generation)";
    
    if ([deviceString isEqualToString:@"iPad7,1"])    return @"iPad Pro (12.9-inch, 2nd generation)";
    if ([deviceString isEqualToString:@"iPad7,2"])    return @"iPad Pro (12.9-inch, 2nd generation)";
    
    if ([deviceString isEqualToString:@"iPad7,3"])    return @"iPad Pro (10.5-inch)";
    if ([deviceString isEqualToString:@"iPad7,4"])    return @"iPad Pro (10.5-inch)";
    
    
    //iPad mini
    if ([deviceString isEqualToString:@"iPad2,5"])    return @"iPad mini";
    if ([deviceString isEqualToString:@"iPad2,6"])    return @"iPad mini";
    if ([deviceString isEqualToString:@"iPad2,7"])    return @"iPad mini";
    
    if ([deviceString isEqualToString:@"iPad4,4"])    return @"iPad mini 2";
    if ([deviceString isEqualToString:@"iPad4,5"])    return @"iPad mini 2";
    if ([deviceString isEqualToString:@"iPad4,6"])    return @"iPad mini 2";
    
    if ([deviceString isEqualToString:@"iPad4,7"])    return @"iPad mini 3";
    if ([deviceString isEqualToString:@"iPad4,8"])    return @"iPad mini 3";
    if ([deviceString isEqualToString:@"iPad4,9"])    return @"iPad mini 3";
    
    if ([deviceString isEqualToString:@"iPad5,1"])    return @"iPad mini 4";
    if ([deviceString isEqualToString:@"iPad5,2"])    return @"iPad mini 4";
    
    
    //iPod
    if ([deviceString isEqualToString:@"iPod1,1"])    return @"iPod touch";
    if ([deviceString isEqualToString:@"iPod2,1"])    return @"iPod touch (2nd generation)";
    if ([deviceString isEqualToString:@"iPod3,1"])    return @"iPod touch (3nd generation)";
    if ([deviceString isEqualToString:@"iPod4,1"])    return @"iPod touch (4nd generation)";
    if ([deviceString isEqualToString:@"iPod5,1"])    return @"iPod touch (5nd generation)";
    if ([deviceString isEqualToString:@"iPod7,1"])    return @"iPod touch (6nd generation)";
    
    //iWatch
    if ([deviceString isEqualToString:@"Watch1,1"])    return @"Apple Watch (1st generation)";
    if ([deviceString isEqualToString:@"Watch1,2"])    return @"Apple Watch (1st generation)";
    if ([deviceString isEqualToString:@"Watch2,6"])    return @"Apple Watch Series 1";
    if ([deviceString isEqualToString:@"Watch2,7"])    return @"Apple Watch Series 1";
    
    if ([deviceString isEqualToString:@"Watch2,3"])    return @"Apple Watch Series 2";
    if ([deviceString isEqualToString:@"Watch2,4"])    return @"Apple Watch Series 2";
    
    if ([deviceString isEqualToString:@"Watch3,1"])    return @"Apple Watch Series 3";
    if ([deviceString isEqualToString:@"Watch3,2"])    return @"Apple Watch Series 3";
    if ([deviceString isEqualToString:@"Watch3,3"])    return @"Apple Watch Series 3";
    if ([deviceString isEqualToString:@"Watch3,4"])    return @"Apple Watch Series 3";
    
    return nil;
}

//获取本机运营商名称
+ (NSString *)getCurrentDeviceOperators{
    
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    //当前手机所属运营商名称
    
    NSString *mobile = @"";
    
    //先判断有没有SIM卡，如果没有则不获取本机运营商
    
    if (!carrier.isoCountryCode) {
        
        NSLog(@"没有SIM卡");
        mobile = @"未插卡";
    }else{
        
        mobile = [carrier carrierName];
        
    }
    return mobile;
}

/**获取当前设备 IMSI*/
+ (NSString *)getCurrentDeviceIMSI{
    
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    NSString *mcc = [carrier mobileCountryCode];
    NSString *mnc = [carrier mobileNetworkCode];
    mcc = mcc.length >0?mcc:@"";
    mnc = mnc.length >0?mnc:mnc;
    NSString *imsi = [NSString stringWithFormat:@"%@%@", mcc, mnc];
    
    return imsi;
}

/**获取分辨率*/
+ (NSString *)getCurrentDeviceScale{
    CGFloat scale = [UIScreen mainScreen].nativeScale;
    return [NSString stringWithFormat:@"%lf",scale];
}



@end
