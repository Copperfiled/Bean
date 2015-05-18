//
//  LoginView.h
//  Homework_03
//
//  Created by guanxiaobai on 4/22/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface LoginView : UIView

@property (nonatomic,assign) id target;
@property (nonatomic, assign) SEL action;

@property (nonatomic, retain) UIButton *loginButton;
@property (nonatomic, retain) UIButton *registButton;
@property (nonatomic, retain) UIButton *cancelButton;

@end
