//
//  BotItem.h
//  ipcVM
//
//  Created by Sean on 2018/1/2.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "ItemBase.h"

@interface BotItem : ItemBase
typedef NS_ENUM(NSInteger, BotItemStyle) {
    BotItemStyleNone,          // regular table view
    BotItemStyleStates         // preferences style table view
};

@property(nonatomic ,copy)NSString   *name;

@property(nonatomic, copy)NSString   *states;

@property(nonatomic, copy)NSString   *allStates;

@property(nonatomic,assign)BotItemStyle style;

-(instancetype)initWithName:(NSString *)name withStates:(NSString *)states;

-(instancetype)initWithallStates:(NSString *)allStates;

@end
