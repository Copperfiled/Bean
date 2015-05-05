//
//  LoginViewController.m
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "UserSingelton.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)login
{
    NSLog(@"welcome");
    //create a singleton object
    UserSingelton *userSingle = [UserSingelton shareInstance];
    userSingle.isLogin = YES;
    
    [self back];
}
- (void)regist
{
    RegistViewController *registVC = [[RegistViewController alloc]init];
    [self.navigationController pushViewController:registVC animated:YES];
    [registVC release];
    NSLog(@"Regist");
}
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Login";
    // Do any additional setup after loading the view.
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    loginButton.frame = CGRectMake(30, 100, 140, 40);
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    UIButton *registButton = [UIButton buttonWithType:UIButtonTypeSystem];
    registButton.frame = CGRectMake(200, 100, 140, 40);
    [registButton setTitle:@"Regist" forState:UIControlStateNormal];
    [registButton addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registButton];

    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backItem;
    [backItem release];
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
