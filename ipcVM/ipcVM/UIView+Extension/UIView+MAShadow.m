//
//  UIView+MAShadow.m
//  MicroAnswer
//
//  Created by joe on 16/8/23.
//
//

#import "UIView+MAShadow.h"

@implementation UIView (MAShadow)

- (void)addShadowWithColor:(UIColor *)color shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius{
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowRadius = shadowRadius;
}

@end
