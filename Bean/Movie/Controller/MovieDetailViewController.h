//
//  MovieDetailViewController.h
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;
@class MovieDetailView;

@interface MovieDetailViewController : UIViewController<NSURLConnectionDataDelegate, NSURLConnectionDelegate>

@property (nonatomic, retain) Movie *movie;

@property (nonatomic, retain) MovieDetailView *movieDetailView;
@property (nonatomic, retain) NSMutableData *urlData;

@end
