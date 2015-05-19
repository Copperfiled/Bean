//
//  userHundle.h
//  Bean
//
//  Created by guanxiaobai on 5/18/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "User.h"

//这个类用来操作数据库中的users表
@interface userHundle : NSObject

+ (BOOL) isExistWithName:(NSString *)name;
+ (void) addUser:(User *)user;

@end
