//
//  LoginView.h
//  Homework_03
//
//  Created by guanxiaobai on 4/22/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface LoginView : UIView

@property (assign, nonatomic) id target;
@property (assign, nonatomic) SEL action;

@property (retain, nonatomic) UIButton *loginButton;
@property (retain, nonatomic) UIButton *registButton;
@property (retain, nonatomic) UIButton *cancelButton;

@end
