//
//  UserTableViewController.m
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "UserTableViewController.h"
#import "MyActivityTableViewController.h"
#import "MyMovieTableViewController.h"  
#import "LoginViewController.h"
#import "UserSingelton.h"

@interface UserTableViewController ()

@end

@implementation UserTableViewController

- (void)dealloc
{
    [_dataSource release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"MyPage";
    _dataSource = [[NSMutableArray alloc]initWithObjects:@"My activity", @"My movie", @"Clear cache", nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *logoutItem = [[UIBarButtonItem alloc]initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
    self.navigationItem.rightBarButtonItem = logoutItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)logout
{
    UserSingelton *user = [UserSingelton shareInstance];
    if (user.isLogin) {
        //already login, then log out
        user.isLogin = NO;
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:loginVC];
        [self presentViewController:navC animated:YES completion:nil];
        [loginVC release];
        [navC release];
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuserIdentifier = @"user";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserIdentifier];
    
    // Configure the cell...
    if (nil == cell) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserIdentifier]autorelease];
    }
    cell.textLabel.text = _dataSource[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserSingelton *user = [UserSingelton shareInstance];
    switch (indexPath.row) {
        case 0:
        {
            if (!user.isLogin) {
                [self enterLoginViewControllerSceneWithType:indexPath.row];
            }
            else
            {
                [self enterActivityViewController];
            }
        }
            break;
        case 1:
        {
            if (!user.isLogin) {
                [self enterLoginViewControllerSceneWithType:indexPath.row];
            }
            else [self enterMovieDetailViewController];
        }
            break;
        default:
            NSLog(@"Clear success");
            break;
    }
}
- (void)enterLoginViewControllerSceneWithType:(NSInteger)type
{
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    
    loginVC.successBlock = ^{
        switch (type) {
            case 0:
                [self enterActivityViewController];
                break;
            case 1:
                [self enterMovieDetailViewController];
                break;
            default:
                NSLog(@"clear success!");
                break;
        }
    };
    
    UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginVC];
    
    [self presentViewController:loginNav animated:YES completion:nil];
    [loginNav release];
    [loginVC release];
}

- (void)enterActivityViewController
{
    MyActivityTableViewController *myActivity = [[MyActivityTableViewController alloc]init];
    [self.navigationController pushViewController:myActivity animated:YES];
    [myActivity release];
}

- (void)enterMovieDetailViewController
{
    MyMovieTableViewController *myMovieVC = [[MyMovieTableViewController alloc]init];
    [self.navigationController pushViewController:myMovieVC animated:YES];
    [myMovieVC release];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
