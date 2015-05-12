//
//  CinemaListTableViewCell.h
//  Bean
//
//  Created by guanxiaobai on 5/9/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Cinema;

@interface CinemaListTableViewCell : UITableViewCell

@property (nonatomic, retain) Cinema *cinema;

@property (nonatomic, readonly, retain) UIImageView *bgImgView;
@property (nonatomic, readonly, retain) UILabel *cinemaNameLabel;
@property (nonatomic, readonly, retain) UILabel *addressLabel;
@property (nonatomic, readonly, retain) UILabel *telephoneLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
