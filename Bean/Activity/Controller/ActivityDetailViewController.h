//
//  ActivityDetailViewController.h
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Activity;
@class ActivityDetailView;

@interface ActivityDetailViewController : UIViewController

@property (nonatomic, retain) ActivityDetailView *activityDetailView;
@property (nonatomic, retain) Activity *activity;

@end
