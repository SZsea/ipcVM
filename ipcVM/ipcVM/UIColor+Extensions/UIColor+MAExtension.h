//
//  UIColor+MAExtension.h
//  MicroAnswer
//
//  Created by joe on 16/12/13.
//  Copyright © 2016年 joe. All rights reserved.
//

#define UIColorRGBA(_red, _green, _blue, _alpha) [UIColor colorWithRed:((_red)/255.0) \
green:((_green)/255.0) blue:((_blue)/255.0) alpha:(_alpha)]

#define UIColorRGB(red, green, blue) UIColorRGBA(red, green, blue, 1)

@interface UIColor (MAExtension)

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

- (void)getRGBComponents:(CGFloat [3])components;

+ (UIColor *)randomColor;

@end
