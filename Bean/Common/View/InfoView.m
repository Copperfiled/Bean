//
//  InfoView.m
//  Bean
//
//  Created by guanxiaobai on 5/8/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "InfoView.h"

@implementation InfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!!self) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        _infoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, width / 10, 20)];
//        _infoImgView.backgroundColor = [UIColor redColor];
        [self addSubview:_infoImgView];
        
        _infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(5 + width / 10, 5, width * 9 / 10, height)];
//        _infoLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:_infoLabel];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame image:(NSString *)imageName text:(NSString *)text
{
    self = [self initWithFrame:frame];
    if (self) {
        _infoImgView.image = [UIImage imageNamed:imageName];
        _infoLabel.text = text;
    }
    return self;
}
@end
