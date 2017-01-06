//
//  UIColor+YGExtension.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/3/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "UIColor+YGExtension.h"

@implementation UIColor (YGExtension)

+ (UIColor *)randomColor
{
    return [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
}

@end
