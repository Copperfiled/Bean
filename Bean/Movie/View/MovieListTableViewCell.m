//
//  MovieListTableViewCell.m
//  Bean
//
//  Created by guanxiaobai on 5/8/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "MovieListTableViewCell.h"
#import "Movie.h"

#define kHorizonPadding 10

@implementation MovieListTableViewCell

- (void)dealloc
{
    [_movieImgView release];
    [_movieNameLabel release];
    [super dealloc];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = [UIScreen mainScreen].bounds;
        _bgImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kHorizonPadding, 10, rect.size.width - 20, 140)];
        _bgImgView.image = [UIImage imageNamed:@"bg_eventlistcell"];
        [self.contentView addSubview:_bgImgView];
        
        _movieImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kHorizonPadding + 10, 15, rect.size.width * 0.23, 130)];
//        _movieImgView.backgroundColor = [UIColor redColor];
        _movieImgView.image = [UIImage imageNamed:@"picholder"];
        [self.contentView addSubview:_movieImgView];
        
        _movieNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizonPadding + 10 + 0.3 * rect.size.width, 2 * 140 / 5 + 10, rect.size.width * 0.6, 40)];
//        _movieNameLabel.text = @"摩登森林之美食总动员";
        _movieNameLabel.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_movieNameLabel];
    }
    return self;
}

- (void)setMovie:(Movie *)movie
{
    if (_movie != movie) {
        [_movie release];
        _movie = [movie retain];
        
        _movieNameLabel.text = movie.movieName;
    }
}

@end
