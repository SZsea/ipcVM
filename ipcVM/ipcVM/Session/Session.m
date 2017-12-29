//
//  Session.m
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "Session.h"

@implementation Session

SINGLETON_IMPLEMENT_FOR_CLASS([self class])

//- (instancetype)init {
//    if (self = [super init]){
//
//
//    }
//    return self;
//}

#pragma mark public

- (BOOL)isLogin {
    return (self.account.length);
}




@end
