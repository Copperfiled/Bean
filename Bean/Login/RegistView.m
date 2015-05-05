//
//  RegistView.m
//  Homework_03
//
//  Created by guanxiaobai on 4/22/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "RegistView.h"
#import "LTView.h"

@implementation RegistView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutSubviews
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationLandscapeLeft == orientation || UIInterfaceOrientationLandscapeRight == orientation) {
        for (int i = 0; i < 5; ++i) {
            LTView *ltV = (LTView *)[self viewWithTag:(1000 + i)];
            [ltV.textField resignFirstResponder];
            ltV.frame = CGRectMake(100, i * 30, 400, 20);
        }
        _cancelButton.frame = CGRectMake(150, 160, 60, 30);
        _confirmButton.frame = CGRectMake(250, 160, 60, 30);
    }
    else
    {
        for (int i = 0; i < 5; ++i) {
            LTView *ltV = (LTView *)[self viewWithTag:(1000 + i)];
            ltV.frame = CGRectMake(X_OFFSET, Y_OFFSET + i * 50, 270, 330);
        }
        LTView *ltV = (LTView *)[self viewWithTag:1000];
        [ltV.textField becomeFirstResponder];
        _cancelButton.frame = CGRectMake(50, 300, 50, 20);
        _confirmButton.frame = CGRectMake(130, 300, 80, 20);
    }
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //点击空白处回收键盘
    [_target performSelector:_action withObject:self];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *textArray = @[@"name", @"password", @"confirm", @"phone", @"email"];
        NSArray *placeholder = @[@"Enter name", @"Enter password",@"password again",@"enter phone", @"enter email"];
        
        for (int i = 0; i < [textArray count]; ++i) {
            LTView *ltV = [[LTView alloc]initWithFrame:CGRectMake(X_OFFSET, Y_OFFSET + i * 50, 270, 30) text:[textArray objectAtIndex:i]  placeholder:[placeholder objectAtIndex:i]];
            ltV.tag = TAG_OFFSET + i;
            [self addSubview:ltV];
            [ltV release];
        }
        //30,250
        
        //set cancel button
        _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
        _cancelButton.frame = CGRectMake(50, 300, 50, 20);
        [self addSubview:_cancelButton];
        
        //set confirmButton
        _confirmButton  = [UIButton buttonWithType:UIButtonTypeSystem];
        [_confirmButton setTitle:@"confirm" forState:UIControlStateNormal];
        _confirmButton.frame = CGRectMake(130, 300, 80, 20);
        [self addSubview:_confirmButton];
//        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
@end
