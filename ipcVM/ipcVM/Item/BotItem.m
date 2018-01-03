//
//  BotItem.m
//  ipcVM
//
//  Created by Sean on 2018/1/2.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "BotItem.h"

@implementation BotItem

-(instancetype)initWithName:(NSString *)name withStates:(NSString *)states
{
    if(self = [super init])
    {
        _name = [name copy];
        _states = [states copy];
        _style = BotItemStyleNone;
    }
    return self;
}
-(instancetype)initWithallStates:(NSString *)allStates
{
    if(self = [super init])
    {
        _allStates = [allStates copy];
        _style = BotItemStyleStates;
    }
    return self;
    
    
}
@end
