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
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[self alloc]init];
        cache.imageCache = [[[NSCache alloc]init]autorelease];
    });
    return cache;
}

@end
