//
//  UILabel+Additional.m
//  Bean
//
//  Created by guanxiaobai on 5/6/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "UILabel+Additional.h"

@implementation UILabel (Additional)

- (instancetype)initWithFrame:(CGRect)frame description:(NSString *)description alignment:(NSTextAlignment)alignment
{
    self = [self initWithFrame:frame];
    self.text = description;
    self.textAlignment = alignment;
    return self;
}

@end
