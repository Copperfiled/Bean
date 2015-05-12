//
//  UserSingelton.h
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserSingelton : NSObject

@property (nonatomic, assign) BOOL isLogin;

+ (UserSingelton *) shareInstance;

@end
