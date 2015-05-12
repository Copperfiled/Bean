//
//  ActivityListTableViewController.m
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "ActivityListTableViewController.h"
#import "ActivityDetailViewController.h"
#import "ActivityListTableViewCell.h"
#import "Activity.h"

#import "DownloadUtil.h"

@interface ActivityListTableViewController ()

@end

@implementation ActivityListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Activity";
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    // Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //请求网络数据
    NSString *urlStr = @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/activitylist.php";
//    _urlData = [[NSMutableData alloc]init];   
    
    /*
     * 1. 初始化DownloadUtil对象(指定URL)，由它负责请求并下载数据
     * 2. 接收下载的数据
     * 3. 下载完成之后，解析数据
     */
    //创建对象（初始化请求，连接）
    DownloadUtil *downloadUtil = [[DownloadUtil alloc]initWithURL:urlStr];

    //连接完成后的操作
    downloadUtil.downloadBlock = ^(){
        //获取数据
        _urlData = downloadUtil.urlData;
        
        NSMutableDictionary *mDic = [NSJSONSerialization JSONObjectWithData:_urlData options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSMutableArray *eventsArray = [mDic valueForKey:@"events"];
        
        _activityMArray = [[NSMutableArray alloc]initWithCapacity:eventsArray.count];
        
        for (NSDictionary *dic in eventsArray) {
            
            Activity *activity = [[Activity alloc]init];
            [activity setValuesForKeysWithDictionary:dic];
            [_activityMArray addObject:activity];
            [activity release];
        }
        NSLog(@"data length = %ld", _urlData.length);
        [self.tableView reloadData];
    };
//    NSLog(@"data length = %ld", _urlData.length);
    
//    NSURL *url = [NSURL URLWithString:urlStr];
//    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
//    [NSURLConnection connectionWithRequest:request delegate:self];
//    [request release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
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
    return _activityMArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"activity";
    ActivityListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (nil == cell) {
        cell = [[[ActivityListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier] autorelease];
    }
    // Configure the cell...
    cell.movieImgView.image = [UIImage imageNamed:@"picholder"];
    cell.activity = _activityMArray[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityDetailViewController *detailVC = [[ActivityDetailViewController alloc]init];
    //传模型到详情界面
    detailVC.activity = _activityMArray[indexPath.row];
    
    [self.navigationController pushViewController:detailVC animated:YES];
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
