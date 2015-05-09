//
//  CinemaListTableViewCell.m
//  Bean
//
//  Created by guanxiaobai on 5/9/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "CinemaListTableViewCell.h"

#import "Cinema.h"

#define kHerizonPadding 10
#define kVerticalPadding 10

@implementation CinemaListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [_bgImgView release];
    [_cinemaNameLabel release];
    [_addressLabel release];
    [_telephoneLabel release];
    [super dealloc];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    CGRect rect = [UIScreen mainScreen].bounds;
    CGFloat width = rect.size.width - 2 * kHerizonPadding;
    CGFloat height = rect.size.height;
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //Configure the view for this cell
        _bgImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kHerizonPadding, kVerticalPadding, width, (height - 64 - 49) / 5)];
        _bgImgView.image = [UIImage imageNamed:@"bg_eventlistcell"];
        [self.contentView addSubview:_bgImgView];
        
        _cinemaNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHerizonPadding + 5, kVerticalPadding, width - 10, 30)];
//        _cinemaNameLabel.backgroundColor = [UIColor redColor];
        _cinemaNameLabel.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_cinemaNameLabel];
        
        _addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHerizonPadding + 5, kVerticalPadding + 30, width - 10, 50)];
//        _addressLabel.backgroundColor = [UIColor blueColor];
        _addressLabel.font = [UIFont systemFontOfSize:15];
        _addressLabel.numberOfLines = 0;
        [self.contentView addSubview:_addressLabel];

        _telephoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHerizonPadding + 5, kVerticalPadding + 80, width - 10, 30)];
//        _telephoneLabel.backgroundColor = [UIColor greenColor];
        _telephoneLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_telephoneLabel];
    }
    return self;
}

- (void)setCinema:(Cinema *)cinema
{
    if (_cinema != cinema) {
        [_cinema release];
        _cinema = [cinema retain];
        
        _cinemaNameLabel.text = _cinema.cinemaName;
        _addressLabel.text = _cinema.address;
        _telephoneLabel.text = _cinema.telephone;
    }
}

@end
