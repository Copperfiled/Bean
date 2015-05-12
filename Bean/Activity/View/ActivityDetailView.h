//
//  ActivityDetailView.h
//  Bean
//
//  Created by guanxiaobai on 5/8/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InfoView;
@class Activity;

@interface ActivityDetailView : UIScrollView<NSURLConnectionDataDelegate>

@property (nonatomic, readonly, retain) UILabel *titleLabel;
@property (nonatomic, readonly, retain) UIImageView *largeImageView;
@property (nonatomic, readonly, retain) UILabel *contentLabel;

@property (nonatomic, readonly, retain) InfoView *dateInfoView;
@property (nonatomic, readonly, retain) InfoView *ownerInfoView;
@property (nonatomic, readonly, retain) InfoView *catalogInfoView;
@property (nonatomic, readonly, retain) InfoView *addressInfoView;

@property (nonatomic, readonly, retain) NSMutableData *imageData;
@property (nonatomic, retain) Activity *activity;

//overite
- (void)dealloc;
- (instancetype)initWithFrame:(CGRect)frame;
- (void)setActivity:(Activity *)activity;

@end
