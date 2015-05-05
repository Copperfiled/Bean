//
//  LoginViewController.m
//  Homework_03
//
//  Created by guanxiaobai on 4/22/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LTView.h"
//#import "RegistViewController.h"
#import "ContainerViewController.h"

#define NAMEFIELD_TAG 1111
#define PASSWORDFIELD_TAG 1112

@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark----------------Actions--------------------

-(void)recycleKeyboard:(LoginView *)loginView
{
        LTView *nameLTView = (LTView *)[loginView viewWithTag:1000];
        LTView *passLTView = (LTView *)[loginView viewWithTag:1001];
        if ([nameLTView.textField isFirstResponder]) {
            [nameLTView.textField resignFirstResponder];
        } else if ([passLTView.textField isFirstResponder])
        {
            [passLTView.textField resignFirstResponder];
        }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == NAMEFIELD_TAG) {
        LTView *ltV = (LTView *)[self.view viewWithTag:1001];
        [ltV.textField becomeFirstResponder];
//        [ltV release];
    }
    else
    {
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark-------------------control view----------------
-(void)loadView
{
//    [super loadView];
    LoginView *loginView = [[LoginView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [loginView.loginButton addTarget:self.parentViewController action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [loginView.registButton addTarget:self.parentViewController action:@selector(enterRegistView) forControlEvents:UIControlEventTouchUpInside];
    [loginView.cancelButton addTarget:self.parentViewController action:@selector(findPassword) forControlEvents:UIControlEventTouchUpInside];
    
    //设置loginView的target/action
    loginView.target = self;
    loginView.action = @selector(recycleKeyboard:);
    
//    NSArray *array = [loginView subviews];
    
    LTView *ltV = (LTView *)[loginView viewWithTag:1000];//nameTF
    ltV.textField.delegate = self;
    ltV.textField.tag = NAMEFIELD_TAG;
    [ltV.textField becomeFirstResponder];
    
    LTView *ltV2 = (LTView *)[loginView viewWithTag:1001];
    ltV2.textField.delegate = self;
    ltV2.textField.tag = PASSWORDFIELD_TAG;
//    [ltV release];
//    [ltV2 release];
    
    self.view = loginView;
    [loginView release];
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
