//
//  Activity.h
//  Bean
//
//  Created by guanxiaobai on 5/7/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Activity : UITableViewCell

@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *begin_time;
@property (nonatomic, retain) NSString *end_time;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *category_name;
@property (nonatomic, retain) NSString *image;
@property (nonatomic, assign) NSInteger wisher_count;
@property (nonatomic, assign) NSInteger participant_count;

- (void)dealloc;

@end
