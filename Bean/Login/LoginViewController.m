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

- (void)dealloc
{
    [_loginView release];
    [super dealloc];
}
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

- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
    NSString *name = ((LTView *)[self.view viewWithTag:1000]).textField.text;//nameTF
    NSString *pass = ((LTView *)[self.view viewWithTag:1001]).textField.text;//passTF
    
    NSUserDefaults *users = [NSUserDefaults standardUserDefaults];
    NSArray *userArray = [users objectForKey:name];
    
    UserSingelton *singleton = [UserSingelton shareInstance];
    if ([name isEqualToString:userArray[0]] && [pass isEqualToString:userArray[1]])
    {
        //login succeed
        singleton.isLogin = YES;
        [self dismissViewControllerAnimated:YES completion:nil];
        if (_successBlock) {
            _successBlock();//block
        }
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
- (void)loadView
{
    _loginView = [[LoginView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _loginView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Login";
    // Do any additional setup after loading the view.
    [_loginView.loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [_loginView.registButton addTarget:self action:@selector(enterRegistView) forControlEvents:UIControlEventTouchUpInside];
    [_loginView.cancelButton addTarget:self action:@selector(findPassword) forControlEvents:UIControlEventTouchUpInside];
    
    //设置loginView的target/action
    _loginView.target = self;
    _loginView.action = @selector(recycleKeyboard:);
    
    LTView *ltV = (LTView *)[_loginView viewWithTag:1000];//nameTF
    ltV.textField.delegate = self;
    ltV.textField.tag = NAMEFIELD_TAG;
    [ltV.textField becomeFirstResponder];
    
    LTView *ltV2 = (LTView *)[_loginView viewWithTag:1001];
    ltV2.textField.delegate = self;
    ltV2.textField.tag = PASSWORDFIELD_TAG;
    
    self.view.backgroundColor = [UIColor whiteColor];
    //新增
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backItem;
    self.navigationController.hidesBarsOnTap = YES;

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
