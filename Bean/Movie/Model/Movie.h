//
//  Movie.h
//  Bean
//
//  Created by guanxiaobai on 5/8/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Movie : NSObject

@property (nonatomic, retain) NSString *movieId;
@property (nonatomic, retain) NSString *movieName;
@property (nonatomic, retain) NSString *pic_url;

//将Movie添加到user的收藏表中
+ (void)addMovie:(Movie *) movie ByUser:(User *)user;
//将user用户的所有Movie显示出来
+ (NSArray *)allMoviesWithUser:(User *)user;

+ (void)deleteMovieByID:(int)ID;
+ (BOOL)movieExistWithID:(int)ID;

@end
