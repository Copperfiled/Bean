//
//  MovieListCollectionViewController.m
//  Bean
//
//  Created by guanxiaobai on 5/15/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "MovieListCollectionViewController.h"
#import "MovieDetailViewController.h"

#import "MovieListCollectionViewCell.h"

#import "CacheSingleton.h"  
#import "Movie.h"
#import "DownloadUtil.h"

@interface MovieListCollectionViewController ()

- (void) startDownloadImage:(NSString *)url atIndexPath:(NSIndexPath *)indexPath;

@end

@implementation MovieListCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[MovieListCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Movie";
    
    UIBarButtonItem *listItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_list"] style:UIBarButtonItemStylePlain target:self action:@selector(backToList)];
    listItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = listItem;
    
    self.navigationItem.hidesBackButton = YES;
//    self.navigationController.navigationItem.leftBarButtonItem = nil;
    //添加背景色
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action methods -

- (void)backToList
{
    [self dismissViewControllerAnimated:YES completion:^{
        //do something
    }];
//    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return _movieArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    CGRect rect = [UIScreen mainScreen].bounds;
    
    MovieListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.movie = _movieArray[indexPath.row];
    
    CacheSingleton *cache = [CacheSingleton shareInstance];
    
    if (!![cache.imageCache objectForKey:cell.movie.pic_url]) {
        //缓存中存在
        NSLog(@"从缓存中读取");
        cell.movieImgView.image = [cache.imageCache objectForKey:cell.movie.pic_url];
    }
    else
    {
        [self startDownloadImage:cell.movie.pic_url atIndexPath:indexPath];
    }
    return cell;
}

#pragma mark - defer download image -

- (void) startDownloadImage:(NSString *)url atIndexPath:(NSIndexPath *)indexPath
{
    MovieListCollectionViewCell *cell = (MovieListCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    
    DownloadUtil *downloader = [[DownloadUtil alloc]initWithURL:url];
    downloader.downloadBlock = ^() {
        cell.movieImgView.image = [UIImage imageWithData:downloader.urlData];
    };
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MovieDetailViewController *detailVC = [[MovieDetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
    //把movie传给detailVC
    detailVC.movie = _movieArray[indexPath.row];
    
    [detailVC release];
}

// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

#pragma mark - UICollectionViewDelegateFlowLayout -

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 20);
}

@end
