//
//  UIColor+MAExtension.m
//  MicroAnswer
//
//  Created by joe on 16/12/13.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "UIColor+MAExtension.h"

@implementation UIColor (MAExtension)

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    return [self colorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

- (void)getRGBComponents:(CGFloat [3])components{
    
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    
    unsigned char resultingPixel[4];
    
    CGContextRef context = CGBitmapContextCreate(&resultingPixel,1,1,8,4,rgbColorSpace, kCGImageAlphaNoneSkipLast);
    
    CGContextSetFillColorWithColor(context, [self CGColor]);
    
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    
    CGContextRelease(context);
    
    CGColorSpaceRelease(rgbColorSpace);
    
    for (int component = 0; component < 3; component++) {
        components[component] = resultingPixel[component] / 255.0f;
    }
}

+ (UIColor *)randomColor
{
    CGFloat red = (CGFloat) (arc4random_uniform(255) / 255.0);
    CGFloat green = (CGFloat) (arc4random_uniform(255) / 255.0);
    CGFloat blue = (CGFloat) (arc4random_uniform(255) / 255.0);
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}



@end
