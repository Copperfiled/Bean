//
//  ActivityListTableViewCell.h
//  Bean
//
//  Created by guanxiaobai on 5/7/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Activity;

@interface ActivityListTableViewCell : UITableViewCell

@property (nonatomic, readonly, retain) UIImageView *cellImgView;
@property (nonatomic, readonly, retain) UILabel *contentLabel;
@property (nonatomic, readonly, retain) UIImageView *shareImageView;
@property (nonatomic, readonly, retain) UIImage *dateImg;
@property (nonatomic, readonly, retain) UIImage *spotImg;
@property (nonatomic, readonly, retain) UIImage *catalogImg;
@property (nonatomic, readonly, retain) UILabel *dateLabel;
@property (nonatomic, readonly, retain) UILabel *addressLabl;
@property (nonatomic, readonly, retain) UILabel *categoryLabel;
@property (nonatomic, readonly, retain) UIImageView *movieImgView;
@property (nonatomic, readonly, retain) UILabel *wisherLabel;
@property (nonatomic, readonly, retain) UILabel *participantLabel;
@property (nonatomic, readonly, retain) UILabel *endDateLabel;

@property (nonatomic, retain) Activity *activity;

#pragma mark - init methods-
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

#pragma mark - overite methods-
- (void)dealloc;
- (void)setActivity:(Activity *)activity;

@end
