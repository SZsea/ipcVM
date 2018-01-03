//
//  BotListItem.h
//  ipcVM
//
//  Created by Sean on 2018/1/2.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "ItemBase.h"
@class BotItem;
@interface BotListItem : ItemBase

@property(nonatomic,strong)NSMutableArray <BotItem *>  *BotItemListArray;


@end
