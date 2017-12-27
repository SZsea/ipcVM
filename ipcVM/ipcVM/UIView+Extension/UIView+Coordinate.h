//
//  UIView+Coordinate.h
//  WeiDa
//
//  Created by Abson he on 2016/11/21.
//  Copyright © 2016年 joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Coordinate)

- (CGFloat)top;
- (void)setTop:(CGFloat)top;

- (CGFloat)left;
- (void)setLeft:(CGFloat)left;
- (void)setLeftTo:(UIView *)view toDirect:(ABS_Direct)direct offSet:(CGFloat)offSet;


- (CGFloat)bottom;
- (void)setBottomTo:(UIView *)view toDirect:(ABS_Direct)direct offSet:(CGFloat)offSet;

- (CGFloat)right;
- (void)setRightTo:(UIView *)view toDirect:(ABS_Direct)direct offSet:(CGFloat)offSet;

- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

- (CGFloat)maxWidth;
- (void)setMaxWidth:(CGFloat)width;

- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

- (CGSize)size;
- (void)setSize:(CGSize)size;

- (CGPoint)origin;
- (void)setOrigin:(CGPoint)origin;

- (CGFloat)centerX;
- (void)setCenterX:(CGFloat)centerX;

- (double)centerY;
- (void)setCenterY:(double)centerY;


@end
