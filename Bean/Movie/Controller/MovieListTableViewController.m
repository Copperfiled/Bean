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
#import "MovieListCollectionViewController.h"

#import "Movie.h"

#import "CacheSingleton.h"  
#import "DownloadUtil.h"

@interface MovieListTableViewController ()

@end

@implementation MovieListTableViewController

#pragma mark-----------------select method--------------------------
- (void)changeLayout
{
    /**
     *  模态出一个瀑布流视图
     *
     */
    CGRect rect = [UIScreen mainScreen].bounds;
    
    //用系统自带的layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(rect.size.width / 3, 160);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 20;
    
    MovieListCollectionViewController *movieCollectionVC = [[MovieListCollectionViewController alloc]initWithCollectionViewLayout:flowLayout];
    
    //传数据模型
    movieCollectionVC.movieArray = [NSMutableArray arrayWithArray:_movieArray];
    
    UINavigationController *collectionNaVC = [[UINavigationController alloc]initWithRootViewController:movieCollectionVC];
    [collectionNaVC.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
    
//    //模态
//    [self presentViewController:collectionNaVC animated:YES completion:^{
//        //do something
//    }];
//    [self.navigationController pushViewController:movieCollectionVC animated:YES];
    [UITableView transitionFromView:self.tableView
                             toView:movieCollectionVC.view
                           duration:2.0
                            options:UIViewAnimationOptionTransitionFlipFromLeft
                         completion:^(BOOL finished) {
        [self removeFromParentViewController];
        [self.navigationController addChildViewController:movieCollectionVC];
//        [self.navigationController.view addSubview:movieCollectionVC.view];
    }];
    [flowLayout release];
    [movieCollectionVC release];
    [collectionNaVC release];
    NSLog(@"change layout!");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Movie";
//    UIBarButtonItem *changeItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(changeLayout)];
    UIBarButtonItem *changeItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_collection"] style:UIBarButtonItemStylePlain target:self action:@selector(changeLayout)];
    changeItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = changeItem;
    
    DownloadUtil *downloader = [[DownloadUtil alloc]initWithURL:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/movielist.php"];
    
    downloader.downloadBlock = ^() {
        _urlData = downloader.urlData;
        
        NSLog(@"接受完毕");
        
        NSError *error = nil;
        NSMutableDictionary *mDic = [NSJSONSerialization JSONObjectWithData:_urlData options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
        NSMutableArray *resultArray = [mDic valueForKey:@"result"];
        
        _movieArray = [[NSMutableArray alloc]initWithCapacity:resultArray.count];
        
        for (NSDictionary *tmpDic in resultArray) {
            Movie *movie = [[Movie alloc]init];
            [movie setValuesForKeysWithDictionary:tmpDic];
            [_movieArray addObject:movie];
            [movie release];
        }
        [self.tableView reloadData];
    };
    
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
    
    Movie *movie = _movieArray[indexPath.row];
    cell.movie = movie;
    
    CacheSingleton *cacheSingle = [CacheSingleton shareInstance];
    if (![cacheSingle.imageCache objectForKey:movie.pic_url]) {
        //如果没有缓存
        //延时下载
        [self startDownload:movie.pic_url indexPath:indexPath];
        cell.movieImgView.image = [UIImage imageNamed:@"picholder"];
    }
    else
    {
        NSLog(@"从缓存中读取%@", movie.pic_url);
        cell.movieImgView.image = [cacheSingle.imageCache objectForKey:movie.pic_url];
    }
    
    return cell;
}

#pragma mark - table image support -

- (void)startDownload:(NSString *)url indexPath:(NSIndexPath *)indexPath
{
    Movie *movie = _movieArray[indexPath.row];
    
    DownloadUtil *downloader = [[DownloadUtil alloc]initWithURL:url];
    downloader.downloadBlock = ^(){
        
        MovieListTableViewCell *cell = (MovieListTableViewCell *) [self.tableView cellForRowAtIndexPath:indexPath];
        cell.imageData = downloader.urlData;
        //Display the newly loaded image
        cell.movieImgView.image = [UIImage imageWithData:cell.imageData];
        
        if (cell.movieImgView.image) {
            
            NSLog(@"将%@放入缓存", cell.movieImgView.image);
            CacheSingleton *cache = [CacheSingleton shareInstance];
            [cache.imageCache setObject:cell.movieImgView.image forKey:movie.pic_url];
        }
    };
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
