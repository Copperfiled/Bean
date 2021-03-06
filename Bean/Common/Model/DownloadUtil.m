//
//  DownloadUtil.m
//  Bean
//
//  Created by guanxiaobai on 5/11/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "DownloadUtil.h"
#import "CacheSingleton.h"

#import <UIKit/UIKit.h>

@implementation DownloadUtil

- (instancetype)initWithURL:(NSString *)url
{
    self = [super init];
    if (self) {
        _url = url;
        //创建url对象
        NSURL *URL = [NSURL URLWithString:_url];
        //创建请求
        NSURLRequest *request = [NSURLRequest requestWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
        //创建连接
        [NSURLConnection connectionWithRequest:request delegate:self];
    }
    return self;
}

#pragma mark - NSURLCOnnectionDataDelegate

//接收到响应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"收到响应");
    _urlData = [[NSMutableData alloc]init];
}
//接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"正在下载数据");
    //这里应该将data传给receiver
    [_urlData appendData:data];
}
//下载完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //唯一的不同是在这里：解析数据的过程因对象而异。也即是说仍要执行一系列的解析
    //具体执行何种操作，对象执行的时候才知道
    NSLog(@"下载完成");
    UIImage *image = [UIImage imageWithData:_urlData];
    
    if (!!_downloadBlock) {
        _downloadBlock();
        if (!!image) {
            //存入缓存
            NSLog(@"将%@存入缓存", image);
            CacheSingleton *cache = [CacheSingleton shareInstance];
            [cache.imageCache setObject:image forKey:_url];
        }

    }
}

#pragma mark - NSURLConnectionDelegat

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"url:%@, 下载错误 %@", _url, [error localizedDescription]);
}

@end
