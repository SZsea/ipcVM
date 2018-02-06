//
//  CardFarmerItem.h
//  ipcVM
//
//  Created by Sean on 2018/2/6.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "ItemBase.h"
@class GameFarmItem;
@interface CardFarmerItem : ItemBase

@property(nonatomic,copy)NSString *paused;

@property(nonatomic,copy)NSString *timeRemaining;

@property(nonatomic,strong)NSMutableArray<GameFarmItem *>   *gameToFarm;

@property(nonatomic,strong)NSMutableArray<GameFarmItem *>   *currentGamesFarming;

@end
