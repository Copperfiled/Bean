//
//  LTView.h
//  LessonUICustomView
//
//  Created by guanxiaobai on 4/22/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TAG_OFFSET 1000

#define X_OFFSET 30
#define Y_OFFSET 50

@interface LTView : UIView

-(instancetype)initWithFrame:(CGRect)frame text:(NSString *)text placeholder:(NSString *)placehoder;

@property (retain, nonatomic) UILabel *label;
@property (retain, nonatomic) UITextField *textField;

@end
