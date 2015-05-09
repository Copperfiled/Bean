//
//  MovieListTableViewController.m
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "MovieListTableViewController.h"
#import "MovieDetailViewController.h"
#import "MovieListTableViewCell.h"
#import "Movie.h"

@interface MovieListTableViewController ()

@end

@implementation MovieListTableViewController

#pragma mark-----------------select method--------------------------
- (void)changeLayout
{
    NSLog(@"change layout!");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Movie";
//    UIBarButtonItem *changeItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(changeLayout)];
    UIBarButtonItem *changeItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_collection"] style:UIBarButtonItemStylePlain target:self action:@selector(changeLayout)];
    changeItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = changeItem;
    
    _movieArray = [[NSMutableArray alloc]init];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MovieList" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    NSMutableDictionary *mDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
    for (NSDictionary *tmpDic in [mDic valueForKey:@"result"]) {
        Movie *movie = [[Movie alloc]init];
        [movie setValuesForKeysWithDictionary:tmpDic];
        [_movieArray addObject:movie];
        [movie release];
    }
    
    //去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
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
    return _movieArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"movie";
    MovieListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    // Configure the cell...
    if (nil == cell) {
        cell = [[[MovieListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]autorelease];
    }
    // Configure the cell...

    cell.movieImgView.image = [UIImage imageNamed:@"picholder"];

    cell.movie = _movieArray[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieDetailViewController *detailVC = [[MovieDetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
    //把movie传给detailVC
    detailVC.movie = _movieArray[indexPath.row];
    
    [detailVC release];
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
