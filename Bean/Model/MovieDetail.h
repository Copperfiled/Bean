//
//  MovieDetail.h
//  Bean
//
//  Created by guanxiaobai on 5/9/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetail : NSObject

@property (nonatomic, retain) NSString *poster;
@property (nonatomic, retain) NSString *movieid;
@property (nonatomic, retain) NSString *rating;//评分
@property (nonatomic, retain) NSString *release_date;
@property (nonatomic, retain) NSString *runtime;
@property (nonatomic, retain) NSString *genres;//类型
@property (nonatomic, retain) NSString *country;
@property (nonatomic, retain) NSString *actors;
@property (nonatomic, retain) NSString *plot_simple;

//undefine key
- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
- (id)valueForUndefinedKey:(NSString *)key;

@end
