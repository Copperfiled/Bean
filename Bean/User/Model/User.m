//
//  User.m
//  Bean
//
//  Created by guanxiaobai on 5/6/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "User.h"

@implementation User

- (void)dealloc
{
    [_name release];
    [_password release];
    [_phone release];
    [_email release];
    
    [super dealloc];
}
- (instancetype)initWithName:(NSString *)name password:(NSString *)password phone:(NSString *)phone email:(NSString *)email
{
    self = [super init];
    if (self) {
        self.name = name;
        self.password = password;
        self.phone = phone;
        self.email = email;
    }
    return self;
}

+ (instancetype)userWithName:(NSString *)name password:(NSString *)password phone:(NSString *)phone email:(NSString *)email
{
    return [[[User alloc]initWithName:name password:password phone:phone email:email]autorelease];
}

@end
