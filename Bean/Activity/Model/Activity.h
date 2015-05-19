//
//  Activity.h
//  Bean
//
//  Created by guanxiaobai on 5/7/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface Activity : UITableViewCell

@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *begin_time;
@property (nonatomic, retain) NSString *end_time;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *category_name;
@property (nonatomic, retain) NSString *image;
@property (nonatomic, assign) NSInteger wisher_count;
@property (nonatomic, assign) NSInteger participant_count;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *owner;
@property (nonatomic, retain) NSString *image_hlarge;
@property (nonatomic, retain) NSString *ID;

- (void)dealloc;

//添加此Activity到收藏数据库列表,拥有者为user
+ (void)addActivity:(Activity *)activity withUser:(User *)user;

//返回某个用户的所收藏的Activity
+ (NSArray *)allActivitiesByUser:(User *)user;

//删除user的某个Activity
+ (void) deleteActivityByID:(int)ID;

//查找某个Activity是否存在
+ (BOOL)activityExistWithID:(int)ID;

@end
