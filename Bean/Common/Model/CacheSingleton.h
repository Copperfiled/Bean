//
//  CacheSingleton.h
//  Bean
//
//  Created by guanxiaobai on 5/13/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  缓存单例类
 *
 *  @since 1.0
 */
@interface CacheSingleton : NSObject

@property (retain, nonatomic) NSCache *imageCache;

+ (instancetype) shareInstance;

@end
