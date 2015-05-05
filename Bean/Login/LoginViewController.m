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
#import "RegistViewController.h"
#import "UserSingelton.h"
#import "LTView.h"

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
#pragma mark - UITextField delegate
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
- (void)login
{
    UserSingelton *singleton = [UserSingelton shareInstance];
    LTView *ltV = (LTView *)[self.view viewWithTag:1000];//nameTF
    LTView *ltV2 = (LTView *)[self.view viewWithTag:1001];//passTF
    if ([ltV.textField.text isEqualToString:@"admin"] && [ltV2.textField.text isEqualToString:@"admin"])
    {
        //login succeed
        singleton.isLogin = YES;
        [self dismissViewControllerAnimated:YES completion:nil];
    } else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Reminder" message:@"incorrect name or password!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
}
- (void)enterRegistView
{
    RegistViewController *registVC = [[RegistViewController alloc]init];
    [self.navigationController pushViewController:registVC animated:YES];
    [registVC release];
}
- (void)findPassword
{
    
}
#pragma mark-------------------control view----------------
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Login";
    // Do any additional setup after loading the view.
    LoginView *loginView = [[LoginView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [loginView.loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [loginView.registButton addTarget:self action:@selector(enterRegistView) forControlEvents:UIControlEventTouchUpInside];
    [loginView.cancelButton addTarget:self action:@selector(findPassword) forControlEvents:UIControlEventTouchUpInside];
    
    //设置loginView的target/action
    loginView.target = self;
    loginView.action = @selector(recycleKeyboard:);
    
    LTView *ltV = (LTView *)[loginView viewWithTag:1000];//nameTF
    ltV.textField.delegate = self;
    ltV.textField.tag = NAMEFIELD_TAG;
    [ltV.textField becomeFirstResponder];
    
    LTView *ltV2 = (LTView *)[loginView viewWithTag:1001];
    ltV2.textField.delegate = self;
    ltV2.textField.tag = PASSWORDFIELD_TAG;
    
    self.view = loginView;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [loginView release];

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
