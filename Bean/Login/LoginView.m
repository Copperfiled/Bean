//
//  LoginView.m
//  Homework_03
//
//  Created by guanxiaobai on 4/22/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "LoginView.h"
#import "LTView.h"

#define LEFTPADDING 30
#define TOPPADDING 100
#define LTVHEIGHT 30
#define VERTICALPADDING 30

@implementation LoginView

//处理屏幕旋转
-(void)layoutSubviews
{
    //获取home键的方向
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationLandscapeLeft == orientation || UIInterfaceOrientationLandscapeRight == orientation) {
        //横屏
        LTView *nameLTView = (LTView *)[self viewWithTag:1000];
        LTView *passLTView = (LTView *)[self viewWithTag:1001];
        [nameLTView.textField resignFirstResponder];
        [passLTView.textField resignFirstResponder];
        nameLTView.frame = CGRectMake(100, 20, 400, 20);
        passLTView.frame = CGRectMake(100, 60, 400, 20);
        _loginButton.frame = CGRectMake(130, 100, 50, 20);
        _registButton.frame = CGRectMake(200, 100, 50, 20);
        _cancelButton.frame = CGRectMake(270, 100, 50, 20);
    }
    else
    {
        LTView *nameLTView = (LTView *)[self viewWithTag:1000];
        LTView *passLTView = (LTView *)[self viewWithTag:1001];
        [nameLTView.textField becomeFirstResponder];
        nameLTView.frame = CGRectMake(50, 30, 270, 30);
        passLTView.frame = CGRectMake(50, 100, 270, 30);
        _loginButton.frame = CGRectMake(50, 170, 50, 20);
        _registButton.frame = CGRectMake(120, 170, 50, 20);
        _cancelButton.frame = CGRectMake(190, 170, 50, 20);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //点击空白处,回收键盘
    //交给target/action 去实现键盘回收
    [_target performSelector:_action withObject:self];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
//        CGFloat height = frame.size.height;
        
        NSArray *textArray = @[@"name", @"password"];
        NSArray *placeholder = @[@"Enter name", @"Enter password"];
        
        for (int i = 0; i < 2; ++i) {
            LTView *ltV = [[LTView alloc]initWithFrame:CGRectMake(LEFTPADDING, TOPPADDING + i * 60, width - 2 * LEFTPADDING, LTVHEIGHT) text:[textArray objectAtIndex:i]  placeholder:[placeholder objectAtIndex:i]];
            NSLog(@"ltv frame : %@", NSStringFromCGRect(ltV.frame));
            ltV.tag = 1000 + i;
            [self addSubview:ltV];
            [ltV release];
        }
        //set loginButton
        _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"login_button"] forState:UIControlStateNormal];
        _loginButton.frame = CGRectMake(LEFTPADDING, TOPPADDING + 2 * LTVHEIGHT + 2 * VERTICALPADDING, 100, 50);
        [self addSubview:_loginButton];
        
        //set regist button
        _registButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_registButton setBackgroundImage:[UIImage imageNamed:@"register_button"] forState:UIControlStateNormal];
        _registButton.frame = CGRectMake(150, TOPPADDING + 2 * LTVHEIGHT + 2 * VERTICALPADDING, 100, 50);
        [self addSubview:_registButton];
        
        //set forget button
        _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_cancelButton setTitle:@"forget" forState:UIControlStateNormal];
        _cancelButton.frame = CGRectMake(190, 200, 50, 20);
        [self addSubview:_cancelButton];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
