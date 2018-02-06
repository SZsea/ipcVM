//
//  GameFarmItem.h
//  ipcVM
//
//  Created by Sean on 2018/2/6.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "ItemBase.h"

@interface GameFarmItem : ItemBase

@property(nonatomic,copy)NSString *appID;

@property(nonatomic,copy)NSString *gameName;

@property(nonatomic,copy)NSString *hoursPlayed;

@property(nonatomic,copy)NSString *cardsRemaining;

@end
