//
//  LoginViewController.h
//  Homework_03
//
//  Created by guanxiaobai on 4/22/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginView;

typedef void (^SuccessBlock) ();

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, copy) SuccessBlock successBlock;

- (void)recycleKeyboard:(LoginView *)loginView;
@end
