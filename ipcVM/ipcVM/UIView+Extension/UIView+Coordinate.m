//
//  UIView+Coordinate.m
//  WeiDa
//
//  Created by Abson he on 2016/11/21.
//  Copyright © 2016年 joe. All rights reserved.
//


#import "UIView+Coordinate.h"
//#import "UIAlertView+Blocks.h"

static const void *MaxWidthKey                   = &MaxWidthKey;

@implementation UIView (Coordinate)

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top
{
    self.frame = CGRectMake(self.left, top, self.width, self.height);
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left
{
    self.frame = CGRectMake(left, self.top, self.width, self.height);
}

- (void)setLeftTo:(UIView *)view toDirect:(ABS_Direct)direct offSet:(CGFloat)offSet {
    self.frame = CGRectMake([self p_getValueWithView:view direct:direct] + offSet, self.top, self.width, self.height);
}

- (CGFloat)bottom
{
    return self.top + self.height;
}

- (void)setBottomTo:(UIView *)view toDirect:(ABS_Direct)direct offSet:(CGFloat)offSet {
    self.frame = CGRectMake([self p_getValueWithView:view direct:direct] + offSet - self.height, self.top, self.width, self.height);
}

- (CGFloat)right
{
    return self.left + self.width;
}

- (void)setRightTo:(UIView *)view toDirect:(ABS_Direct)direct offSet:(CGFloat)offSet {
    
    self.frame = CGRectMake([self p_getValueWithView:view direct:direct] + offSet, self.top, self.width, self.height);
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    if (self.maxWidth > 0) {
        width = MIN(width, self.maxWidth);
    }
    self.frame = CGRectMake(self.left, self.top, width, self.height);
}

- (CGFloat)maxWidth {
    return (CGFloat)[(NSNumber *)objc_getAssociatedObject(self, MaxWidthKey) floatValue]; // 得到关联
}

- (void)setMaxWidth:(CGFloat)width {
    
    if (width > 0) {
        objc_setAssociatedObject(self, MaxWidthKey, @(width), OBJC_ASSOCIATION_RETAIN); // 创建关联
        if (self.width > width) {
            self.width = width;
        }
    }
    
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.left, self.top, self.width, height);
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    self.frame = CGRectMake(self.left, self.top, size.width, size.height);
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    self.frame = CGRectMake(origin.x, origin.y, self.width, self.height);
}

- (CGFloat)centerX {
    return self.center.x;
}


- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


- (double)centerY {
    return self.center.y;
}

- (void)setCenterY:(double)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


#pragma mark - private method
- (CGFloat)p_getValueWithView:(UIView *)view direct:(ABS_Direct)direct {
    CGFloat value = 0;
    switch (direct) {
        case ABS_DirectBottom:
            value = view.bottom;
            break;
            
        case ABS_DirectLeft:
            value = view.left;
            break;
            
        case ABS_DirectRight:
            value = view.right;
            break;
            
        case ABS_DirectTop:
            value = view.top;
            break;
        default:
            break;
    }
    
    return value;
}

@end
