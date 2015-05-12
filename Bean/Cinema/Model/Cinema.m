//
//  Cinema.m
//  Bean
//
//  Created by guanxiaobai on 5/9/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "Cinema.h"

@implementation Cinema

- (void)dealloc
{
    [_ID release];
    [_cinemaName release];
    [_address release];
    [_telephone release];
    [super dealloc];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //处理id
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"ID"];
    }
}
- (id)valueForUndefinedKey:(NSString *)key
{
    //处理id
    if ([key isEqualToString:@"id"]) {
        return [self valueForKey:@"ID"];
    }
    return nil;
}
@end
