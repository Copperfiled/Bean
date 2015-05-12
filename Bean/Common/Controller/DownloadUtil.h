//
//  DownloadUtil.h
//  Bean
//
//  Created by guanxiaobai on 5/11/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^downloadDidFinishBlock)();

@interface DownloadUtil : NSObject<NSURLConnectionDataDelegate,NSURLConnectionDelegate>

@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSMutableData *urlData;
@property (nonatomic, copy) downloadDidFinishBlock downloadBlock;

//init
- (instancetype)initWithURL:(NSString *)url;


@end
