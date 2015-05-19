//
//  DBUtil.m
//  Bean
//
//  Created by guanxiaobai on 5/18/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "DBUtil.h"

static sqlite3 *db = nil;

@implementation DBUtil

+ (sqlite3 *)open
{
    if (!!db) {
        return db;
    }
    //获取documents路径
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) [0];

    //获取数据库文件在bundle中的路径,因为在bundle中的文件不能被修改，因此我们需要拷贝一份在Documents下
    NSString *buddleSqlitePath = [[NSBundle mainBundle] pathForResource:@"beanDB" ofType:@"sqlite"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //在documents文件加下需创建一个sqlite文件接收
    NSString *docSqlitePath = [docPath stringByAppendingPathComponent:@"beanDB.sqlite"];
    if (![fileManager fileExistsAtPath:docSqlitePath]) {
        //如果不存在则拷贝一份
        [fileManager copyItemAtPath:buddleSqlitePath toPath:docSqlitePath error:nil];
    }
    if (SQLITE_OK == sqlite3_open([docSqlitePath UTF8String], &db))
    {
        NSLog(@"数据库%@连接成功", docSqlitePath);
        return db;
    }
    else
    {
        NSLog(@"数据库连接失败");
        return nil;
    }
}

//关闭数据库
+ (void)close
{
    if (db) {
        sqlite3_close(db);
        db = nil;
        NSLog(@"关闭数据库");
    }
}

@end
