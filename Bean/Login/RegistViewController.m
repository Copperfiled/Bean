//
//  RegistViewController.m
//  Homework_03
//
//  Created by guanxiaobai on 4/22/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "RegistViewController.h"
#import "RegistView.h"
#import "LTView.h"
//#import "LoginViewController.h"
#import "ContainerViewController.h"

#define NAME_TAG 1111
#define PASS_TAG 1112
#define CONFIRM_TAG 1113
#define TELE_TAG 11114
#define EMAIL_TAG 1115

@interface RegistViewController ()

@end

@implementation RegistViewController

#pragma mark--------------Actions-----------------------
//回收键盘
-(void)recycleKeyboard:(RegistView *)registView
{
    for (int i = 0; i < 5; ++i) {
        LTView *ltV = (LTView *)[registView viewWithTag:(1000+i)];
        if ([ltV.textField isFirstResponder]) {
            [ltV.textField resignFirstResponder];
        }
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    switch (textField.tag) {
        case NAME_TAG:
        {
            //find the password field
            LTView *ltV = (LTView *)[self.view viewWithTag:1001];
            [ltV.textField becomeFirstResponder];
//            [ltV release];
            break;
        }
        case PASS_TAG:
        {
            //find the confirm field
            LTView *ltV = (LTView *)[self.view viewWithTag:1002];
            [ltV.textField becomeFirstResponder];
//            [ltV release];
            break;
        }
            case CONFIRM_TAG:
        {
            //find the tele field
            LTView *ltV = (LTView *)[self.view viewWithTag:1003];
            [ltV.textField becomeFirstResponder];
//            [ltV release];
            break;
        }
            case TELE_TAG:
        {
            //find the email field
            LTView *ltV = (LTView *)[self.view viewWithTag:1004];
            [ltV.textField becomeFirstResponder];
//            [ltV release];
            break;
        }
        default:
            [textField resignFirstResponder];
            break;
    }
    return YES;
}

-(void)loadView
{
//    [super loadView];
    RegistView *registView = [[RegistView alloc]initWithFrame:[UIScreen mainScreen].bounds];//attention
    
    //add target/action
    registView.target = self;
    registView.action = @selector(recycleKeyboard:);
    
    //set button event
    [registView.confirmButton addTarget:self.parentViewController action:@selector(confirmRegist) forControlEvents:UIControlEventTouchUpInside];
    [registView.cancelButton addTarget:self.parentViewController action:@selector(backToLoginView) forControlEvents:UIControlEventTouchUpInside];
    
    //set name textfield
    LTView *nameLTView = (LTView *)[registView viewWithTag:1000];
    nameLTView.textField.tag = NAME_TAG;
    nameLTView.textField.delegate = self;
    [nameLTView.textField becomeFirstResponder];
//    [nameLTView release];
    
    //set password textfield
    LTView *passLTView = (LTView *)[registView viewWithTag:1001];
    passLTView.textField.tag = PASS_TAG;
    passLTView.textField.delegate = self;
//    [passLTView release];
    
    //set confirm textfield
    LTView *confirmLTView = (LTView *)[registView viewWithTag:1002];
    confirmLTView.textField.tag = CONFIRM_TAG;
    confirmLTView.textField.delegate = self;
//    [confirmLTView release];
    
    //set tele textfield
    LTView *teleLTView = (LTView *)[registView viewWithTag:1003];
    teleLTView.textField.tag = TELE_TAG;
    teleLTView.textField.delegate = self;
//    [teleLTView release];
    
    //set email textfield
    LTView *emailLTView = (LTView *)[registView viewWithTag:1004];
    emailLTView.textField.tag = EMAIL_TAG;
    emailLTView.textField.delegate = self;
//    [emailLTView release];
    
    self.view = registView;
    [registView release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
