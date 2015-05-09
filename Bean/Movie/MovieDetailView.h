//
//  MovieDetailView.h
//  Bean
//
//  Created by guanxiaobai on 5/9/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MovieDetail;

@interface MovieDetailView : UIScrollView<NSURLConnectionDataDelegate>

@property (nonatomic, readonly, retain) UIImageView *posterImgView;
@property (nonatomic, readonly, retain) UILabel *ratingLabel;
@property (nonatomic, readonly, retain) UILabel *releaseTimeLabel;
@property (nonatomic, readonly, retain) UILabel *runtimeLabel;
@property (nonatomic, readonly, retain) UILabel *genresLabel;
@property (nonatomic, readonly, retain) UILabel *countryLabel;
@property (nonatomic, readonly, retain) UILabel *actorsLabel;
@property (nonatomic, readonly, retain) UILabel *plotLabel;

@property (nonatomic, retain) MovieDetail *movieDetail;
@property (nonatomic, readonly, retain) NSMutableData *imageData;

//init
- (instancetype)initWithFrame:(CGRect)frame;

//set
- (void)setMovieDetail:(MovieDetail *)movieDetail;

@end
