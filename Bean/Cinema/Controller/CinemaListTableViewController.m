//
//  CinemaListTableViewController.m
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "CinemaListTableViewController.h"
#import "CinemaListTableViewCell.h"

#import "Cinema.h"  
#import "DownloadUtil.h"

@interface CinemaListTableViewController ()

@end

@implementation CinemaListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Cinema";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    DownloadUtil *downloadUtil = [[DownloadUtil alloc]initWithURL:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/cinemalist.php"];
    downloadUtil.downloadBlock = ^() {
        _urlData = downloadUtil.urlData;
        
        NSMutableDictionary *tmpDic = [NSJSONSerialization JSONObjectWithData:_urlData options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSMutableDictionary *resultDic = [tmpDic valueForKey:@"result"];
        NSMutableArray *dataArray = [resultDic valueForKey:@"data"];
        
        //解析数据
        _cinemaArray = [[NSMutableArray alloc]initWithCapacity:dataArray.count];
        
        for (NSDictionary *dic in dataArray) {
            Cinema *cinema = [[Cinema alloc]init];
            [cinema setValuesForKeysWithDictionary:dic];
            [_cinemaArray addObject:cinema];
            [cinema release];
        }
        [self.tableView reloadData];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cell height
    return ([UIScreen mainScreen].bounds.size.height - 64 - 49)/ 4;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _cinemaArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"cinema";
    CinemaListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    // Configure the cell...
    if (nil == cell) {
        cell = [[[CinemaListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]autorelease];
    }
    // Configure the cell...
//    cell.textLabel.text = @"Cinema";
    cell.cinema = _cinemaArray[indexPath.row];
    return cell;
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
