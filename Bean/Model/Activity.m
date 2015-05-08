//
//  Activity.m
//  Bean
//
//  Created by guanxiaobai on 5/7/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "Activity.h"

@implementation Activity

- (void)dealloc
{
    [_content release];
    [_begin_time release];
    [_end_time release];
    [_address release];
    [_category_name release];
    [_image release];
    
    [super dealloc];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}
@end
