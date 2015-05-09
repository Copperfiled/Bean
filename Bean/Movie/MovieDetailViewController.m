//
//  MovieDetailViewController.m
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "LoginViewController.h" 

#import "MovieDetailView.h"

#import "UserSingelton.h"
#import "Movie.h"
#import "MovieDetail.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

#pragma mark - actions -
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
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

- (void)loadView
{
    CGRect rect = [UIScreen mainScreen].bounds;
    //指定根视图
    _movieDetailView = [[MovieDetailView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _movieDetailView.contentSize = CGSizeMake(rect.size.width, 800);
    _movieDetailView.backgroundColor = [UIColor whiteColor];
    self.view = _movieDetailView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = _movie.movieName;
    UIBarButtonItem *detail = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_share"] style:UIBarButtonItemStylePlain target:self action:@selector(collect)];
    detail.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = detail;
    [detail release];
    
    //左Button
    UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    backBarItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = backBarItem;
    [backBarItem release];    
    
    //为根视图配置数据
    NSString *resource = [NSString stringWithFormat:@"m%@", _movie.movieId];
    NSString *path = [[NSBundle mainBundle]pathForResource:resource ofType:@".txt"];
    NSData *data = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves | NSJSONReadingMutableContainers error:nil];
    
    //传数据
    MovieDetail *movieDetail = [[MovieDetail alloc]init];
    [movieDetail setValuesForKeysWithDictionary:[dic valueForKey:@"result"]];
    _movieDetailView.movieDetail = movieDetail;
    [movieDetail release];
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
