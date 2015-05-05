//
//  UserSingelton.m
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "UserSingelton.h"

@implementation UserSingelton

+ (UserSingelton *)shareInstance
{
    static UserSingelton *singal = nil;
    @synchronized(self){
        if (nil == singal) {
            singal = [[UserSingelton alloc]init];
        }
    }
    return singal;
}
@end
