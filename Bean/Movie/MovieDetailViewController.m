//
//  MovieDetailViewController.m
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "LoginViewController.h" 
#import "UserSingelton.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)collect
{
    UserSingelton *singleton = [UserSingelton shareInstance];
    if (!singleton.isLogin) {
        //if it has not login, present the login view
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginVC];
        [self presentViewController:loginNav animated:YES completion:nil];
        
        [loginNav release];
        [loginVC release];
    }
    else
    {
        NSLog(@"movie detail");
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"movie";
    UIBarButtonItem *detail = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(collect)];
    self.navigationItem.rightBarButtonItem = detail;
    [detail release];
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
