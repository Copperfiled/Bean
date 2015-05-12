//
//  RegistViewController.h
//  Homework_03
//
//  Created by guanxiaobai on 4/22/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegistView;

@interface RegistViewController : UIViewController<UITextFieldDelegate>
@property (retain, nonatomic) RegistView *registView;
- (void)recycleKeyboard:(RegistView *)registView;

@end
