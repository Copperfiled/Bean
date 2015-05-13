//
//  CacheSingleton.m
//  Bean
//
//  Created by guanxiaobai on 5/13/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "CacheSingleton.h"

static CacheSingleton *cache = nil;

@implementation CacheSingleton

+ (instancetype)shareInstance
{
    @synchronized(self) {
        if (nil == cache) {
            cache = [[CacheSingleton alloc]init];
            //初始化imageCache
            cache.imageCache = [[[NSCache alloc]init]autorelease];
        }
    }
    
    return cache;
}

@end
