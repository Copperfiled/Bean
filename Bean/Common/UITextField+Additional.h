//
//  UITextField+Additional.h
//  Bean
//
//  Created by guanxiaobai on 5/6/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Additional)

//init methods

//add placeholder and isSecureEntry
- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder isSecureEntry:(BOOL)isSecureEntry;
//add keyboardType
- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder isSecureEntry:(BOOL)isSecureEntry keyboardType:(UIKeyboardType)keyboardType;

@end
