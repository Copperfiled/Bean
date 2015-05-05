//
//  LoginViewController.h
//  Homework_03
//
//  Created by guanxiaobai on 4/22/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginView;

@interface LoginViewController : UIViewController<UITextFieldDelegate>

- (void)recycleKeyboard:(LoginView *)loginView;
@end
