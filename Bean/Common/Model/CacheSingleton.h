//
//  CacheSingleton.h
//  Bean
//
//  Created by guanxiaobai on 5/13/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheSingleton : NSObject

@property (retain, nonatomic) NSCache *imageCache;

+ (instancetype) shareInstance;

@end
