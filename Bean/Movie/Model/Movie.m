//
//  Movie.m
//  Bean
//
//  Created by guanxiaobai on 5/8/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "Movie.h"

#import "DBUtil.h"
#import "User.h"

@implementation Movie

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

+ (void)addMovie:(Movie *) movie ByUser:(User *)user
{
    sqlite3 *db = [DBUtil open];
    
    NSString *sql = @"insert into movies (ID,title,userName)values(?, ?,?)";
    sqlite3_stmt *stmt = nil;
    int result = sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
    if (SQLITE_OK == result) {
        sqlite3_bind_int(stmt, 1, [movie.movieId intValue]);
        sqlite3_bind_text(stmt, 2, [movie.movieName UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 3, [user.name UTF8String], -1, nil);
        
        if (SQLITE_OK == sqlite3_step(stmt)) {
            sqlite3_finalize(stmt);
            NSLog(@"收藏电影成功");
        }
    }
    else
    {
        NSLog(@"添加失败");
    }
    [DBUtil close];
}

+ (NSArray *)allMoviesWithUser:(User *)user
{
    NSMutableArray *array = nil;
    sqlite3 *db = [DBUtil open];
    NSString *sql = @"select * from movies where userName = ?";
    sqlite3_stmt *stmt = nil;
    int result = sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
    if (SQLITE_OK == result) {
        array = [NSMutableArray array];
        sqlite3_bind_text(stmt, 1, [user.name UTF8String], -1, nil);
        while (SQLITE_ROW == sqlite3_step(stmt)) {
            Movie *movie = [[Movie alloc]init];
            int movieID = sqlite3_column_int(stmt, 0);
            const unsigned char *cMovieName = sqlite3_column_text(stmt, 1);
            
            movie.movieId = [@(movieID) stringValue];
            movie.movieName = [NSString stringWithUTF8String:(const char *)cMovieName];
            [array addObject:movie];
            [movie release];
        }
        sqlite3_finalize(stmt);
        [DBUtil close];
    }
    NSLog(@"关闭数据库");
    return array;
}

+ (void)deleteMovieByID:(int)ID
{
    sqlite3 *db = [DBUtil open];
    
    NSString *sql = @"delete from movies where ID = ?";
    sqlite3_stmt *stmt = nil;
    int result = sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
    if (SQLITE_OK == result) {
        sqlite3_bind_int(stmt, 1, ID);
        
        if (SQLITE_OK == sqlite3_step(stmt)) {
            sqlite3_finalize(stmt);
            NSLog(@"删除电影成功");
        }
    }
    else
    {
        NSLog(@"删除失败");
        return;
    }
    [DBUtil close];
}
+ (BOOL)movieExistWithID:(int)ID
{
    sqlite3 *db = [DBUtil open];
    NSString *sql = @"select * from movies where ID = ?";
    sqlite3_stmt *stmt = nil;
    if (SQLITE_OK == sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL)) {
        sqlite3_bind_int(stmt, 1, ID);
        sqlite3_step(stmt);
        sqlite3_finalize(stmt);
        [DBUtil close];
        return YES;
    }
    else
    {
        [DBUtil close];
        return NO;
    }
    return NO;
}

@end
