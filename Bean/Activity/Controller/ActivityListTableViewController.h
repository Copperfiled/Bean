//
//  ActivityListTableViewController.h
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ActivityListTableViewController : UITableViewController<NSURLConnectionDataDelegate, NSURLConnectionDelegate>

@property (retain, nonatomic) NSMutableArray *activityMArray;
@property (retain, nonatomic) NSMutableData *urlData;

@end
