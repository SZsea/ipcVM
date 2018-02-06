//
//  BotDetailItem.h
//  ipcVM
//
//  Created by Sean on 2018/2/6.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "ItemBase.h"
@class BotConfigItem;
@class CardFarmerItem;

@interface BotDetailItem : ItemBase

@property(nonatomic,copy)NSString *botName;

@property(nonatomic,copy)NSString *steamID;

@property(nonatomic,copy)NSString *keepRunning;

@property(nonatomic,copy)NSString *accoutFlags;

@property(nonatomic,copy)NSString *avatarHash;

@property(nonatomic,strong)BotConfigItem  *botConfigItem;

@property(nonatomic,strong)CardFarmerItem *cardFarmerItem;
@end
