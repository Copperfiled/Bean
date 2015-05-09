//
//  ActivityListTableViewCell.m
//  Bean
//
//  Created by guanxiaobai on 5/7/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "ActivityListTableViewCell.h"
#import "Activity.h"

#define kVerticalOffset 10
#define kHorizonOffset 20
#define kCellPadding 20
#define kPadding 10
@implementation ActivityListTableViewCell

- (void)dealloc
{
    [_activity release];
    [super dealloc];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = [UIScreen mainScreen].bounds;
        //        UILabel *label = [[UILabel alloc]init];
        _cellImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_eventlistcell"]];
        _cellImgView.frame = CGRectMake(kHorizonOffset, kVerticalOffset, rect.size.width - 40, 180);
        [self.contentView addSubview:_cellImgView];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizonOffset + 10, kVerticalOffset, rect.size.width - 60, 30)];
//        _contentLabel.backgroundColor = [UIColor blueColor];
//        _contentLabel.text = @"content";
        [self.contentView addSubview:_titleLabel];
        
        _shareImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_share_large"]];
        _shareImageView.frame = CGRectMake(kHorizonOffset + 2, kVerticalOffset + 30, rect.size.width - 44, 140);
        [self.contentView addSubview:_shareImageView];
        
        _dateImg = [UIImage imageNamed:@"icon_date"];
        UIImageView *dateImgView = [[UIImageView alloc]initWithImage:_dateImg];
        dateImgView.frame = CGRectMake(kHorizonOffset + 10, kVerticalOffset + 40, 20, 20);
        [self.contentView addSubview:dateImgView];
        [dateImgView release];
        
        _spotImg = [UIImage imageNamed:@"icon_spot"];
        UIImageView *spotImgView = [[UIImageView alloc]initWithImage:_spotImg];
        spotImgView.frame = CGRectMake(kHorizonOffset + 10, kVerticalOffset + 60, 20, 20);
        [self.contentView addSubview:spotImgView];
        [spotImgView release];

        _catalogImg = [UIImage imageNamed:@"icon_catalog"];
        UIImageView *catalogImgView = [[UIImageView alloc]initWithImage:_catalogImg];
        catalogImgView.frame = CGRectMake(kHorizonOffset + 10, kVerticalOffset + 60 + kPadding + 10, 20, 20);
        [self.contentView addSubview:catalogImgView];
        [catalogImgView release];
        
        _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizonOffset + 10 + 20, kVerticalOffset + 40, 0.27 *rect.size.width, 20)];
//        _dateLabel.backgroundColor = [UIColor blueColor];
//        _dateLabel.text = @"08-01 19:00";
        [self.contentView addSubview:_dateLabel];
        
        UILabel *curseLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizonOffset + 30 + 0.27 *rect.size.width, kVerticalOffset + 40, 0.05*rect.size.width, 20)];
//        curseLabel.backgroundColor = [UIColor greenColor];
        curseLabel.text = @"--";
        curseLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:curseLabel];
        [curseLabel release];
        
        _endDateLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizonOffset + 30 + 0.32 *rect.size.width, kVerticalOffset + 40, 0.27 *rect.size.width, 20)];
//        _endDateLabel.backgroundColor = [UIColor redColor];
//        _endDateLabel.text = @"08-01 19:00";
        [self.contentView addSubview:_endDateLabel];
        
        _addressLabl = [[UILabel alloc]initWithFrame:CGRectMake(kHorizonOffset + 10 + 20, kVerticalOffset + 40 + 20, 0.59 *rect.size.width, 20)];
//        _addressLabl.backgroundColor = [UIColor greenColor];
//        _addressLabl.text = @"08-01 19:00 -- 08-31 21:00";
        [self.contentView addSubview:_addressLabl];
        
        UILabel *cataLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizonOffset + 30, kVerticalOffset + 80, 40, 20)];
        cataLabel.text = @"类型:";
//        cataLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:cataLabel];
        [cataLabel release];
        
        _categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizonOffset + 80, kVerticalOffset + 40 + 40, 70, 20)];
//        _categoryLabel.backgroundColor = [UIColor redColor];
//        _categoryLabel.text = @"电影";
        [self.contentView addSubview:_categoryLabel];
        
        UILabel *likeLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizonOffset + 10, 130, 60, 30)];
        likeLabel.text = @"感兴趣:";
//        likeLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:likeLabel];
        [likeLabel release];
        
        _wisherLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizonOffset + 70, 130, 60, 30)];
        _wisherLabel.textColor = [UIColor redColor];
//        _wisherLabel.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_wisherLabel];
        
        UILabel *partLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizonOffset + 130, 130, 40, 30)];
        partLabel.text = @"参加:";
//        partLabel.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:partLabel];
        [partLabel release];
        
        _participantLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizonOffset + 170, 130, 60, 30)];
//        _participantLabel.backgroundColor = [UIColor greenColor];
        _participantLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:_participantLabel];
        
        _movieImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kHorizonOffset + 10 + 20 + 0.59 *rect.size.width, kVerticalOffset + 35, 0.21 *rect.size.width, 130)];
//        _movieImgView.backgroundColor = [UIColor redColor];
//        _movieImgView.image = [UIImage imageNamed:@"picholder"];
        [self.contentView addSubview:_movieImgView];
    }
    return self;
}

- (void)setActivity:(Activity *)activity
{
    if (_activity != activity) {
        [_activity release];
        _activity = [activity retain];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSDate *beginDate = [formatter dateFromString:activity.begin_time];
        NSDate *endDate = [formatter dateFromString:activity.end_time];
        
        NSDateFormatter *stringFormatter = [[NSDateFormatter alloc]init];
        stringFormatter.dateFormat = @"MM-dd HH:mm";
        
        _titleLabel.text = activity.title;
        _dateLabel.text = [stringFormatter stringFromDate:beginDate];
        _endDateLabel.text = [stringFormatter stringFromDate:endDate];
        _addressLabl.text = activity.address;
        _categoryLabel.text = activity.category_name;
        _wisherLabel.text = [@(activity.wisher_count) stringValue];
        _participantLabel.text = [@(activity.participant_count) stringValue];
        
        NSURL *url = [NSURL URLWithString:activity.image];
//        NSData *data = [NSData dataWithContentsOfURL:url];
        //GET请求
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5];
//        request.HTTPMethod = @"POST";
//        [NSURLConnection sendAsynchronousRequest:request
//                                           queue:[[NSOperationQueue alloc] init]
//                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//                                   _movieImgView.image = [UIImage imageWithData:data];
//                               }];
        [NSURLConnection connectionWithRequest:request delegate:self];
        [request release];
        [stringFormatter release];
        [formatter release];
    }
}

#pragma mark - NSURLConnectionDataDelegate - 
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%@", response);
    _imageData = [[NSMutableData alloc]init];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"正在加载图片");
    [_imageData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"图片加载完毕 ---- length : %ld", _imageData.length);
    _movieImgView.image = [UIImage imageWithData:_imageData];
}

@end
