//
//  UIColor+HexRGB.m
//  TestWXGame
//
//  Created by hao on 8/22/15.
//  Copyright (c) 2015 hao. All rights reserved.
//

#import "UIColor+HexRGB.h"

@implementation UIColor (HexRGB)

+ (UIColor *)colorFromHex:(NSInteger)colorInHex
{
    // colorInHex should be value like 0xFFFFFF
    return [UIColor colorWithRed:((float) ((colorInHex & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((colorInHex & 0xFF00)   >> 8))  / 0xFF
                            blue:((float)  (colorInHex & 0xFF))            / 0xFF
                           alpha:1.0];
}

@end
