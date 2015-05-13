//
//  MovieListTableViewCell.h
//  Bean
//
//  Created by guanxiaobai on 5/8/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;

@interface MovieListTableViewCell : UITableViewCell<NSURLConnectionDataDelegate>

@property (nonatomic, readonly, retain) UIImageView *bgImgView;
@property (nonatomic, readonly, retain) UIImageView *movieImgView;
@property (nonatomic, readonly, retain) UILabel *movieNameLabel;

@property (nonatomic, retain) Movie *movie;
@property (nonatomic, retain) NSMutableData *imageData;

//overite methods
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)setMovie:(Movie *)movie;

@end
