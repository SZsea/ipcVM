//
//  CardFarmerItem.m
//  ipcVM
//
//  Created by Sean on 2018/2/6.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "CardFarmerItem.h"
#import "GameFarmItem.h"
@implementation CardFarmerItem


-(instancetype)init
{
    if(self = [super init])
    {
        _gameToFarm = [NSMutableArray new];
        _currentGamesFarming = [NSMutableArray new];
    }
    return self;
}
@end
