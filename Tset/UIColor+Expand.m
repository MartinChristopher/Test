//
//  UIColor+Expand.m
//  demo
//
//  Created by 张鹏 on 13-5-15.
//  Copyright (c) 2013年 zhangpeng. All rights reserved.
//

#import "UIColor+Expand.h"

@implementation UIColor (Expand)

+ (UIColor *)normalRandomColor {
    
    static BOOL seeded = NO;
    if (!seeded) {
        seeded = YES;
        // srandom()这个函数是初始化随机数产生器
        srandom((int)time(NULL));
    }
    // random()函数产生随即值
    CGFloat red   = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat blue  = (CGFloat)random() / (CGFloat)RAND_MAX;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)specialRandomColor {
    
    CGFloat hue = arc4random() % 256 / 256.0 ;  //  0.0 to 1.0
    CGFloat saturation = arc4random() % 128 / 256.0 + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = arc4random() % 128 / 256.0 + 0.5;  //  0.5 to 1.0, away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
