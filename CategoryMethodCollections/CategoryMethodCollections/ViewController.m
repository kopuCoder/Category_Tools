//
//  ViewController.m
//  FlashLoanCrashDemo
//
//  Created by Bruce Chin on 16/8/26.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "ViewController.h"
#import "UIView+sk_tools.h"
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;


@end

@implementation ViewController

//字典key为nil
- (IBAction)btnClick:(id)sender {
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

//向NSNumber发送length消息
- (IBAction)btn2Click:(id)sender {
    NSString *jsonStr = @"{\"phone\":17701083996,\"isJoinClass\":\"false\",\"schoolName\":\"［米学］测试学校\",\"classIds\":\"557d97810cf2f3668d0b7231\",\"easeRegister\":true,\"userType\":\"parent\",\"termId\":\"56cfea230cf2a401aa97a903\",\"city\":\"350701\",\"easePassword\":\"000000\",\"gradeIds\":\"557d977c0cf2956f0a13c120\",\"token\":\"10981b59614e1d9063c77a7348e131c9\",\"verified\":true,\"userId\":\"55cda1560cf25908c6fad850\",\"province\":\"3507\",\"userInfo\":[{\"childId\":\"55cda1560cf25908c6fad84e\",\"typeInClass\":\"parents\",\"childName\":\"张岩\",\"classId\":\"557d97810cf2f3668d0b7231\",\"classCode\":\"OY261\",\"className\":\"二年级1班\",\"isHeadTeacher\":false,\"medal\":\"\",\"subjectNames\":[]}],\"ifGraduated\":false,\"isVirtualSchool\":0,\"alias\":\"张岩妈妈\",\"classId\":\"557d97810cf2f3668d0b7231\",\"sciences\":[],\"changeClassButton\":\"false\",\"isTeacherRevoke\":\"1\",\"realName\":\"张岩妈妈\",\"subUserId\":\"\",\"schoolId\":\"557d952a0cf2f3668d0b7220\",\"photoUrl\":\"http://mexue-user-photo.oss-cn-beijing.aliyuncs.com/577ca05ec94f6e49feb812dd\",\"success\":true,\"inviteParents\":\"true\",\"isParentRevoke\":\"0\",\"easeNo\":\"18514531826\"}";
       
       NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
       NSDictionary * responseObjct = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
       
       NSString * testString = responseObjct[@"phone"];
       NSLog(@"testString:%@",[testString class]);
       if(testString.length>2){
           NSLog(@"长度大于2:%@",testString);
       }
}
- (IBAction)btn3Click:(id)sender {
    
    //模拟数组越界
       NSMutableArray * tempArray = [NSMutableArray arrayWithObjects:@"VALUE1",@"VALUE2",@"VALUE3",nil];
       if(tempArray[5]){}
       if([tempArray objectAtIndex:6]){}
       
       NSMutableArray * emptyMulArr = [NSMutableArray new];
       if(emptyMulArr[10]){}
       if([emptyMulArr objectAtIndex:16]){}
       
       
       NSArray * testArray = [[NSArray alloc] init];
       if(testArray[3]){}
       if([testArray objectAtIndex:100]){}
       
       NSArray * testArray2 = [[NSArray alloc] initWithObjects:@"12",@"34", nil];
       if(testArray2[30]){}
       if([testArray2 objectAtIndex:100]){}
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RandomColor;
    [self.contentView sk_radiusWithRadius:20 corner:0];
}


@end























