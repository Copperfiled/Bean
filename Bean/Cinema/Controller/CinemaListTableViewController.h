//
//  CinemaListTableViewController.h
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaListTableViewController : UITableViewController<NSURLConnectionDelegate,NSURLConnectionDataDelegate>

@property (nonatomic, retain) NSMutableArray *cinemaArray;
@property (nonatomic, retain) NSMutableData *urlData;

@end
