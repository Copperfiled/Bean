//
//  MovieDetailView.m
//  Bean
//
//  Created by guanxiaobai on 5/9/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "MovieDetailView.h"
#import "UILabel+AdjustHeightForLabel.h"

#import "MovieDetail.h"

#define kHerizonPadding 20

@implementation MovieDetailView

- (void)dealloc
{
    [_posterImgView release];
    [_ratingLabel release];
    [_runtimeLabel release];
    [_genresLabel release];
    [_countryLabel release];
    [_actorsLabel release];
    [_plotLabel release];
    [_movieDetail release];
    
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGRect rect = [UIScreen mainScreen].bounds;
        CGFloat width = rect.size.width - 2 * kHerizonPadding;
        CGFloat height = rect.size.height;
        
        //configure this view
        _posterImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kHerizonPadding, 20, width / 3, height / 4)];
        _posterImgView.image = [UIImage imageNamed:@"picholder"];
        [self addSubview:_posterImgView];
        
        //评分
        _ratingLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHerizonPadding + width / 3 + 20, 20, 2 * width / 3 - 20, 20)];
//        _ratingLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_ratingLabel];
        
        //发行日期
        _releaseTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHerizonPadding + width / 3 + 20, 50, 2 * width / 3 - 20, 20)];
//        _releaseTimeLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:_releaseTimeLabel];
        
        //时长
        _runtimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHerizonPadding + width / 3 + 20, 80, 2 * width / 3 - 20, 20)];
//        _runtimeLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_runtimeLabel];
        
        //类型
        _genresLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHerizonPadding + width / 3 + 20, 110, 2 * width / 3 - 20, 20)];
//        _genresLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:_genresLabel];
        
        //国家
        _countryLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHerizonPadding + width / 3 + 20, 140, 2 * width / 3 - 20, 20)];
//        _countryLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_countryLabel];
        
        UILabel *actorHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHerizonPadding, 20 + height / 4 + 10, 100, 30)];
        actorHolderLabel.text = @"制作人";
//        actorHolderLabel.backgroundColor = [UIColor redColor];
        [self addSubview:actorHolderLabel];
        [actorHolderLabel release];
        
        _actorsLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHerizonPadding, 20 + height / 4 + 10 + 30 , width, 50)];
        _actorsLabel.numberOfLines = 0;
//        _actorsLabel.backgroundColor = [UIColor blueColor];
        _actorsLabel.font = [UIFont systemFontOfSize:15];
        _actorsLabel.textAlignment = NSTextAlignmentJustified;
        [self addSubview:_actorsLabel];
        
        UILabel *plotHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHerizonPadding, 20 + height / 4 + 90, 80, 30)];
        plotHolderLabel.text = @"电影情节";
//        plotHolderLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:plotHolderLabel];
        [plotHolderLabel release];
        
        _plotLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _plotLabel.numberOfLines = 0;
        _plotLabel.font = [UIFont systemFontOfSize:13];
        _plotLabel.lineBreakMode = NSLineBreakByWordWrapping;
//        _plotLabel.backgroundColor = [UIColor purpleColor];
        [self addSubview:_plotLabel];
        
    }
    return self;
}

- (void)setMovieDetail:(MovieDetail *)movieDetail
{
    CGRect rect = [UIScreen mainScreen].bounds;
//    CGFloat width = rect.size.width - 2 * kHerizonPadding;
    CGFloat height = rect.size.height;
    if (_movieDetail != movieDetail) {
        [_movieDetail release];
        _movieDetail = [movieDetail retain];
        
        _ratingLabel.text = [NSString stringWithFormat:@"评分: %@", _movieDetail.rating];
        _releaseTimeLabel.text = _movieDetail.release_date;
        _runtimeLabel.text = _movieDetail.runtime;
        _genresLabel.text = _movieDetail.genres;
        _countryLabel.text = _movieDetail.country;
        _actorsLabel.text = _movieDetail.actors;
        _plotLabel.text = _movieDetail.plot_simple;
        
        CGSize size = [UILabel heightForLabel:_plotLabel.text];
        _plotLabel.frame = CGRectMake(20, 20 + height / 4 + 90 + 30 + 10, size.width, size.height);
        
        NSURL *url = [NSURL URLWithString:_movieDetail.poster];
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:10];
//        [NSURLConnection sendAsynchronousRequest:request
//                                           queue:[[NSOperationQueue alloc]init]
//                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//                                   _posterImgView.image = [UIImage imageWithData:data];
//                               }];
        [NSURLConnection connectionWithRequest:request delegate:self];
    }
}

#pragma mark - NSURLConnectionDataDelegate - 

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"受到响应");
    
    _imageData = [[NSMutableData alloc]init];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_imageData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _posterImgView.image = [UIImage imageWithData:_imageData];
}

@end
