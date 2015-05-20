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

#import "userHundle.h"
#import "DBUtil.h"
#import "User.h"

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
    else if (![Activity activityExistWithID:[_activity.ID intValue]])
    {
        //不存在
        NSLog(@"Collect success!");
        //将此Activity添加到活动收藏表activities中
        
        [Activity addActivity:_activity withUser:userSingle.currentUser];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Reminder" message:@"collect successfull" delegate:nil cancelButtonTitle:@"Confirm" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    } else {
        //已经存在
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Reminder" message:@"Cannot be collected twice!" delegate:nil cancelButtonTitle:@"Confirm" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
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
