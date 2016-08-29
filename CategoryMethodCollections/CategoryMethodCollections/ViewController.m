//
//  ViewController.m
//  FlashLoanCrashDemo
//
//  Created by 秦茂军 on 16/8/26.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "ViewController.h"
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RandomColor;
    
    
    [self test1]; //字典key为nil
    [self test2]; //向NSNumber发送length消息
    [self test3];//数组越界问题
    
}

- (void)test1{
    
    /* 这种初始化错误
     //crahs log: -[__NSPlaceholderDictionary initWithObjectsAndKeys:]
     //http://www.tuicool.com/articles/Y3EfAv7 参考
     NSDictionary * tempDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"value",nil,nil];
     NSLog(@"tempDict:%@",tempDict);
     */
    
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    NSString * key = nil;
    NSString * value = @"我就测试一下";
    [dict setValue:value forKey:key];
}

- (void)test2{//向NSNumber发送length消息
    NSString *jsonStr = @"{\"phone\":17701083996,\"isJoinClass\":\"false\",\"schoolName\":\"［米学］测试学校\",\"classIds\":\"557d97810cf2f3668d0b7231\",\"easeRegister\":true,\"userType\":\"parent\",\"termId\":\"56cfea230cf2a401aa97a903\",\"city\":\"350701\",\"easePassword\":\"000000\",\"gradeIds\":\"557d977c0cf2956f0a13c120\",\"token\":\"10981b59614e1d9063c77a7348e131c9\",\"verified\":true,\"userId\":\"55cda1560cf25908c6fad850\",\"province\":\"3507\",\"userInfo\":[{\"childId\":\"55cda1560cf25908c6fad84e\",\"typeInClass\":\"parents\",\"childName\":\"张岩\",\"classId\":\"557d97810cf2f3668d0b7231\",\"classCode\":\"OY261\",\"className\":\"二年级1班\",\"isHeadTeacher\":false,\"medal\":\"\",\"subjectNames\":[]}],\"ifGraduated\":false,\"isVirtualSchool\":0,\"alias\":\"张岩妈妈\",\"classId\":\"557d97810cf2f3668d0b7231\",\"sciences\":[],\"changeClassButton\":\"false\",\"isTeacherRevoke\":\"1\",\"realName\":\"张岩妈妈\",\"subUserId\":\"\",\"schoolId\":\"557d952a0cf2f3668d0b7220\",\"photoUrl\":\"http://mexue-user-photo.oss-cn-beijing.aliyuncs.com/577ca05ec94f6e49feb812dd\",\"success\":true,\"inviteParents\":\"true\",\"isParentRevoke\":\"0\",\"easeNo\":\"18514531826\"}";
    
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary * responseObjct = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSString * testString = responseObjct[@"phone"];
    NSLog(@"testString:%@",[testString class]);
    if(testString.length>2){
        NSLog(@"长度大于2:%@",testString);
    }
    
}

- (void)test3{ //模拟数组越界
    NSMutableArray * tempArray = [NSMutableArray arrayWithObjects:@"VALUE1",@"VALUE2",@"VALUE3",nil];
    NSString * result = tempArray[3];
    
    NSArray * testArray = [[NSArray alloc] init];
    NSString * result2 = testArray[3];
    
}


@end























