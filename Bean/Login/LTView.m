//
//  LTView.m
//  LessonUICustomView
//
//  Created by guanxiaobai on 4/22/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "LTView.h"

@implementation LTView

- (void)dealloc
{
    [_label release];
    [_textField release];
    [super dealloc];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//-(void)layoutSubviews
//{
//    CGFloat width = super.frame.size.width - 15;
//    CGFloat height = super.frame.size.height - 4;
//    
//    _label.frame = CGRectMake(5, 2, width / 3, height);
//    
//    _textField.frame = CGRectMake(_label.frame.origin.x + _label.frame.size.width + 5, 2, 2 * width / 3, height);
//}
-(instancetype)initWithFrame:(CGRect)frame text:(NSString *)text placeholder:(NSString *)placehoder
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width - 15;
        CGFloat height = frame.size.height - 4;
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(5, 2, width / 3, height)];
        _label.textAlignment = NSTextAlignmentLeft;
//        _label.backgroundColor = [UIColor whiteColor];
        _label.text = text;
//        self.labelText = text;
        
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(_label.frame.origin.x + _label.frame.size.width + 5, 2, 2 * width / 3, height)];
        _textField.placeholder = placehoder;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
//        _textField.delegate = self;
//        self.placeholder = placehoder;
        
        [self addSubview:_label];
        [self addSubview:_textField];
        
    }
    return self;
}
@end
