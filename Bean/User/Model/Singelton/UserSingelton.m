//
//  UserSingelton.m
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "UserSingelton.h"

static UserSingelton *singal = nil;

@implementation UserSingelton

+ (UserSingelton *)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singal = [[self alloc]init];
    });
    return singal;
}

@end
