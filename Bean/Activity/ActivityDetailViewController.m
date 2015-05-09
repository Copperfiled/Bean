//
//  ActivityDetailViewController.m
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "LoginViewController.h" 

#import "ActivityDetailView.h"

#import "UserSingelton.h"
#import "Activity.h"

@interface ActivityDetailViewController ()

@end

@implementation ActivityDetailViewController

#pragma mark - actions -
- (void) back
{
    [self.navigationController popViewControllerAnimated:YES];
}
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
- (void)loadView
{
    _activityDetailView = [[ActivityDetailView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _activityDetailView.backgroundColor = [UIColor whiteColor];
    self.view = _activityDetailView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Activity detail";

    //左Button
    UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    backBarItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = backBarItem;
    [backBarItem release];
    
    //右Button
    UIBarButtonItem *detailItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_share"] style:UIBarButtonItemStylePlain target:self action:@selector(collect)];
    detailItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = detailItem;
    [detailItem release];    
    
    //传模型给自己的视图
    _activityDetailView.activity = _activity;
    self.navigationItem.title = _activity.title;
    
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
