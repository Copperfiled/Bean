//
//  MovieListCollectionViewCell.m
//  Bean
//
//  Created by guanxiaobai on 5/15/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "MovieListCollectionViewCell.h"

#import "Movie.h"

@implementation MovieListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _movieImgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 0, self.frame.size.width - 30, self.frame.size.height - 30)];
        _movieImgView.image = [UIImage imageNamed:@"picholder"];
        [self addSubview:_movieImgView];
        
        _movieNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, self.frame.size.height - 30, self.frame.size.width - 30, 30)];
//        _movieNameLabel.backgroundColor = [UIColor redColor];
        _movieNameLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        _movieNameLabel.font = [UIFont systemFontOfSize:15];
        _movieNameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_movieNameLabel];
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
