//
//  Activity.m
//  Bean
//
//  Created by guanxiaobai on 5/7/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "Activity.h"

#import "User.h"
#import "DBUtil.h"

@implementation Activity

- (void)dealloc
{
    [_content release];
    [_begin_time release];
    [_end_time release];
    [_address release];
    [_category_name release];
    [_image release];
    [_title release];
    [_owner release];
    [super dealloc];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"ID"];
    }
}
- (id)valueForUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        return [self valueForKey:_ID];
    }
    return nil;
}

+ (void)addActivity:(Activity *)activity withUser:(User *)user
{
    sqlite3 *db = [DBUtil open];
    NSString *sql = @"insert into activities (ID, title, userName) values(?,?,?)";
    sqlite3_stmt *stmt = nil;
    int result = sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
    if (SQLITE_OK == result) {
        //暂时存放默认ID
        //从1开始
        sqlite3_bind_int(stmt, 1, [activity.ID intValue]);
        sqlite3_bind_text(stmt, 2, [activity.title UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 3, [user.name UTF8String], -1, nil);
        
        sqlite3_step(stmt);
        sqlite3_finalize(stmt);
        NSLog(@"添加成功");
    }
    [DBUtil close];
}

+ (NSArray *)allActivitiesByUser:(User *)user
{
    NSMutableArray *array = nil;
    sqlite3 *db = [DBUtil open];
    NSString *sql = @"select * from activities where userName = ?";
    sqlite3_stmt *stmt = nil;
    
    int result = sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
    if (SQLITE_OK == result) {
        sqlite3_bind_text(stmt, 1, [user.name UTF8String], -1, nil);
        array = [NSMutableArray array];
        while (SQLITE_ROW == sqlite3_step(stmt)) {
            int ID = sqlite3_column_int(stmt, 0);
            const unsigned char *cTitle = sqlite3_column_text(stmt, 1);
            
            Activity *activity = [[Activity alloc]init];
            //这是通过数据库查找得到的Activity，只有ID和title
            activity.title = [NSString stringWithUTF8String:(const char *)cTitle];
            activity.ID = [@(ID) stringValue];
            [array addObject:activity];
        }
        sqlite3_finalize(stmt);
    }
    else{
        NSLog(@"查询错误");
    }
    [DBUtil close];
    return array;
}
/**
 *  通过ID删除数据
 *
 *  @param ID activity ID
 *
 *  @since 1.0
 */
+ (void)deleteActivityByID:(int)ID
{
    sqlite3 *db = [DBUtil open];
    NSString *sql = @"delete from activities where ID = ?";
    sqlite3_stmt *stmt = nil;
    if (SQLITE_OK == sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL)) {
        sqlite3_bind_int(stmt, 1, ID);
        if (SQLITE_OK == sqlite3_step(stmt)) {
            NSLog(@"删除成功");
            sqlite3_finalize(stmt);
        }
    }
    else
    {
        NSLog(@"删除错误");
    }
    [DBUtil close];
}

+ (BOOL)activityExistWithID:(int)ID
{
    sqlite3 *db = [DBUtil open];
    NSString *sql = @"select * from activities where ID = ?";
    sqlite3_stmt *stmt = nil;
    if (SQLITE_OK == sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, NULL)) {
        sqlite3_bind_int(stmt, 1, ID);
        int result = sqlite3_step(stmt);
        NSLog(@"%d", result);
        if(SQLITE_ROW == result)
        {
            sqlite3_finalize(stmt);
            [DBUtil close];
            return YES;
        }
    }
    else
    {
        [DBUtil close];
        return NO;
    }
    return NO;
}

@end
