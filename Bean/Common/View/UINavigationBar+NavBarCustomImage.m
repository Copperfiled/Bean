//
//  UINavigationBar+NavBarCustomImage.m
//  Bean
//
//  Created by guanxiaobai on 5/7/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "UINavigationBar+NavBarCustomImage.h"

@implementation UINavigationBar (NavBarCustomImage)

- (void)drawRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"bg_nav"];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}
@end
