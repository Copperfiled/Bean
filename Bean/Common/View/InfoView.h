//
//  InfoView.h
//  Bean
//
//  Created by guanxiaobai on 5/8/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoView : UIView

@property (nonatomic, readonly, retain) UIImageView *infoImgView;
@property (nonatomic, readonly, retain) UILabel *infoLabel;

- (instancetype)initWithFrame:(CGRect)frame;
- (instancetype)initWithFrame:(CGRect)frame image:(NSString *)imageName text:(NSString *)text;
@end
