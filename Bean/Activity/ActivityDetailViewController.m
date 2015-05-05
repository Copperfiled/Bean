//
//  ActivityDetailViewController.m
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "LoginViewController.h" 
#import "UserSingelton.h"

@interface ActivityDetailViewController ()

@end

@implementation ActivityDetailViewController

- (void)collect
{
    UserSingelton *userSingle = [UserSingelton shareInstance];
    if (!userSingle.isLogin) {
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginVC];
        
        [self presentViewController:loginNav animated:YES completion:nil];
        [loginNav release];
        [loginVC release];
    }
    else
    {
        NSLog(@"Collect success!");
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Activity detail";
    
    UIBarButtonItem *detailItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(collect)];
    self.navigationItem.rightBarButtonItem = detailItem;
    [detailItem release];
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
