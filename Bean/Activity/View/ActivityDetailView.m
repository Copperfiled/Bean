//
//  ActivityDetailView.m
//  Bean
//
//  Created by guanxiaobai on 5/8/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "ActivityDetailView.h"
#import "InfoView.h"

#import "UILabel+AdjustHeightForLabel.h"
#import "Activity.h"

#import "DownloadUtil.h"

@implementation ActivityDetailView

- (void)dealloc
{
    [_titleLabel release];
    [_largeImageView release];
    
    [_dateInfoView release];
    [_ownerInfoView release];
    [_catalogInfoView release];
    [_addressInfoView release];
    
    [_contentLabel release];
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!!self) {
        CGRect rect = [UIScreen mainScreen].bounds;
        self.contentSize = CGSizeMake(rect.size.width, 2 * rect.size.height);
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, rect.size.width - 60, 50)];
//        _titleLabel.backgroundColor = [UIColor redColor];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:_titleLabel];
        
        //imageView
        _largeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 70, (rect.size.width - 60) / 3, 160)];
        [self addSubview:_largeImageView];
        
        _dateInfoView = [[InfoView alloc]initWithFrame:CGRectMake(30 + (rect.size.width - 60) / 3, 75, (rect.size.width - 60) * 2 / 3, 20)];
        _dateInfoView.infoImgView.image = [UIImage imageNamed:@"icon_date_blue"];
        [self addSubview:_dateInfoView];
        
        _ownerInfoView = [[InfoView alloc]initWithFrame:CGRectMake(30 + (rect.size.width - 60) / 3, 100, (rect.size.width - 60) * 2 / 3, 20)];
        _ownerInfoView.infoImgView.image = [UIImage imageNamed:@"icon_sponsor_blue"];
        [self addSubview:_ownerInfoView];
        
        _catalogInfoView = [[InfoView alloc]initWithFrame:CGRectMake(30 + (rect.size.width - 60) / 3, 125, (rect.size.width - 60) * 2 / 3, 20)];
        _catalogInfoView.infoImgView.image = [UIImage imageNamed:@"icon_catalog_blue"];
        [self addSubview:_catalogInfoView];
        
        _addressInfoView = [[InfoView alloc]initWithFrame:CGRectMake(30 + (rect.size.width - 60) / 3, 150, (rect.size.width - 60) * 2 / 3, 60)];
        _addressInfoView.infoImgView.image = [UIImage imageNamed:@"icon_spot_blue"];
        [self addSubview:_addressInfoView];
        
        UILabel *contentTitle = [[UILabel alloc]initWithFrame:CGRectMake(30, 230, rect.size.width - 60, 20)];
        contentTitle.text = @"活动介绍";
        [self addSubview:contentTitle];
        [contentTitle release];
        
//        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 250, rect.size.width - 60, 1200)];
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_contentLabel];
    }
    return self;
}

- (void)setActivity:(Activity *)activity
{
    if (_activity != activity) {
        
        CGRect rect = [UIScreen mainScreen].bounds;
        
        [_activity release];
        _activity = [activity retain];
        _titleLabel.text = _activity.title;
        
        //date
        //格式化字符串为日期
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSDate *beginDate = [formatter dateFromString:activity.begin_time];
        NSDate *endDate = [formatter dateFromString:activity.end_time];
        
        //格式化日期为字符串
        NSDateFormatter *stringFormatter = [[NSDateFormatter alloc]init];
        stringFormatter.dateFormat = @"MM-dd HH:mm";
        NSString *beginStr = [stringFormatter stringFromDate:beginDate];
        NSString *endStr = [stringFormatter stringFromDate:endDate];
        
        NSString *dateText = [NSString stringWithFormat:@"%@ -- %@", beginStr, endStr];
//#warning - 可以优化的 -
        
        //自定义工具类
        DownloadUtil *downloadUtil = [[DownloadUtil alloc]initWithURL:activity.image_hlarge];
        downloadUtil.downloadBlock = ^() {
            _imageData = downloadUtil.urlData;
            _largeImageView.image = [UIImage imageWithData:_imageData];
        };
        
        _dateInfoView.infoLabel.text = dateText;
        _dateInfoView.infoLabel.font = [UIFont systemFontOfSize:15];
        
        _ownerInfoView.infoLabel.text = [activity.owner valueForKey:@"name"];
        _ownerInfoView.infoLabel.font = [UIFont systemFontOfSize:15];
        
        _catalogInfoView.infoLabel.text = [NSString stringWithFormat:@"类型: %@", activity.category_name];
        _catalogInfoView.infoLabel.font = [UIFont systemFontOfSize:15];
        
        //_dateInfoView.infoImgView.image =
        _addressInfoView.infoLabel.text = activity.address;
        _addressInfoView.infoLabel.font = [UIFont systemFontOfSize:15];
        _addressInfoView.infoLabel.numberOfLines = 0;
        
        _contentLabel.text = activity.content;
        CGSize size = [UILabel heightForLabel:_contentLabel.text];
        _contentLabel.frame = CGRectMake(30, 260, rect.size.width - 60, size.height);
        _contentLabel.numberOfLines = 0;
        [formatter release];
        [stringFormatter release];
    }
}

@end
