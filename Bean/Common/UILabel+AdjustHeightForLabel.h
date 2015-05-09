//
//  UILabel+AdjustHeightForLabel.h
//  Bean
//
//  Created by guanxiaobai on 5/9/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AdjustHeightForLabel)

+ (CGSize) heightForString:(NSString *)str;
+ (CGSize) heightForLabel:(NSString *)text;

@end
