//
//  DBUtil.h
//  Bean
//
//  Created by guanxiaobai on 5/18/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>

/**
 *  数据库操作类
 *
 *  @since 1.0
 */
@interface DBUtil : NSObject

//打开数据库
+ (sqlite3 *) open;

//关闭数据库
+ (void)close;

@end
