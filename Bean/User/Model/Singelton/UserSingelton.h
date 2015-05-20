//
//  UserSingelton.h
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
/**
 *  用户单例类：保证只登陆一次，并且记录当前登录用户
 *
 *  @since <#version number#>
 */
@interface UserSingelton : NSObject

@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, retain) User *currentUser;

+ (UserSingelton *) shareInstance;

@end
