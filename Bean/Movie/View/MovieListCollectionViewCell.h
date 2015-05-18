//
//  MovieListCollectionViewCell.h
//  Bean
//
//  Created by guanxiaobai on 5/15/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;

@interface MovieListCollectionViewCell : UICollectionViewCell

@property (nonatomic, readonly, retain) UIImageView *movieImgView;
@property (nonatomic, readonly, retain) UILabel *movieNameLabel;

@property (nonatomic, retain) Movie *movie;

@end
