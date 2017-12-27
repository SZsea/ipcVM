//
//  UIView+AddsubViews.m
//  FoodStory
//
//  Created by Ansel on 15/10/22.
//  Copyright © 2015年 Abson. All rights reserved.
//

#import "UIView+AddsubViews.h"

@implementation UIView (AddsubViews)

- (void)addSubviews:(NSArray<UIView *> *)views
{
    if (views.count > 0) {
        [views enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self addSubview:obj];
        }];
    }
}

@end
