//
//  userHundle.m
//  Bean
//
//  Created by guanxiaobai on 5/18/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "userHundle.h"
#import "DBUtil.h"

@implementation userHundle

+ (BOOL)isExistWithName:(NSString *)name
{
    //打开数据库
    sqlite3 *db = [DBUtil open];
    
    NSString *sql = @"select * from users where name = ?";
    sqlite3_stmt *stmt = nil;
    
    int result = sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
    if (SQLITE_OK == result) {
        sqlite3_bind_text(stmt, 1, [name UTF8String], -1, nil);
        
        if (SQLITE_ROW == sqlite3_step(stmt)) {
            sqlite3_finalize(stmt);
            [DBUtil close];
            return YES;
        }
    }
    return NO;
}

+ (void)addUser:(User *)user
{
    sqlite3 *db = [DBUtil open];
    NSString *sql = @"insert into users values(?,?,?,?)";
    sqlite3_stmt *stmt = nil;
    int result = sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
    if (SQLITE_OK == result) {
        sqlite3_bind_text(stmt, 1, [user.name UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 2, [user.password UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 3, [user.phone UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 4, [user.email UTF8String], -1, nil);
        
        if (SQLITE_OK == sqlite3_step(stmt)) {
            NSLog(@"插入成功");
            sqlite3_finalize(stmt);
            [DBUtil close];
            return;
        }
    }
}

@end
