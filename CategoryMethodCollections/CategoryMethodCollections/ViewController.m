//
//  ViewController.m
//  CategoryMethodCollections
//
//  Created by 秦茂军 on 16/8/25.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "ViewController.h"
//#import "NSNumber+CrashIntercept.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testNSNumber]; //向NSNumber对象发送一条length消息
}

- (void)testNSNumber{
    NSString * testString =@(124);
    NSLog(@"%ld",testString.length);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
