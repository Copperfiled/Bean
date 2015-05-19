//
//  User.h
//  Bean
//
//  Created by guanxiaobai on 5/6/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *email;

/**
 *  init method
 *
 *  @since 1.0
 */
- (instancetype)initWithName:(NSString *)name password:(NSString *)password phone:(NSString *)phone email:(NSString *)email;
+ (instancetype)userWithName:(NSString *)name password:(NSString *)password phone:(NSString *)phone email:(NSString *)email;

@end
