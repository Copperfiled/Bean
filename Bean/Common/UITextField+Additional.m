//
//  UITextField+Additional.m
//  Bean
//
//  Created by guanxiaobai on 5/6/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "UITextField+Additional.h"

@implementation UITextField (Additional)

- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder isSecureEntry:(BOOL)isSecureEntry keyboardType:(UIKeyboardType)keyboardType
{
    self = [self initWithFrame:frame];
    if (self) {
        self.placeholder = placeholder;
        self.secureTextEntry = isSecureEntry;
        self.borderStyle = UITextBorderStyleRoundedRect;
        self.keyboardType = keyboardType;
    }
    return  self;
}
- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder isSecureEntry:(BOOL)isSecureEntry
{
    return [self initWithFrame:frame placeholder:placeholder isSecureEntry:isSecureEntry keyboardType:UIKeyboardTypeDefault];
}

@end
