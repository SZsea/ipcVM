//
//  BotDetailItem.m
//  ipcVM
//
//  Created by Sean on 2018/2/6.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "BotDetailItem.h"
#import "BotConfigItem.h"
#import "CardFarmerItem.h"
#import "NSDictionary+MAExtension.h"
#import "GameFarmItem.h"
@implementation BotDetailItem

- (void)analyzeNetWorkData:(id)data{
    [super analyzeNetWorkData:data];
    [self searchItem:self.result];
}

-(void)searchItem:(id)data
{
    _cardFarmerBOOL = _botConfigBOOL = NO;
    if (!data) return;
    NSDictionary *dic = data[0];
     if (MA_IsKindOfNSDictionaryClass(dic))
     {
         _botName = [dic purifyStringForKey:@"BotName"];
         _steamID = [dic purifyStringForKey:@"SteamID"];
         _keepRunning = [dic purifyStringForKey:@"KeepRunning"];
         _accoutFlags = [dic purifyStringForKey:@"AccountFlags"];
         _avatarHash = [dic purifyStringForKey:@"AvatarHash"];
         NSDictionary *botConfig = [dic purifyObjectForKey:@"BotConfig"];
         if(MA_IsKindOfNSDictionaryClass(botConfig))
         {
             _botConfigItem =  [[BotConfigItem alloc] init];
             
             
             
             
             
             
             
         }
         NSDictionary *cardsFarmer = [dic purifyObjectForKey:@"CardsFarmer"];
         if(MA_IsKindOfNSDictionaryClass(cardsFarmer))
         {
             _cardFarmerItem =  [[CardFarmerItem alloc] init];
             _cardFarmerItem.paused = [cardsFarmer purifyStringForKey:@"Paused"];
             _cardFarmerItem.timeRemaining = [cardsFarmer purifyStringForKey:@"TimeRemaining"];
             NSArray *CurrentGamesFarming = [cardsFarmer purifyObjectForKey:@"CurrentGamesFarming"];
             if(MA_IsKindOfNSArrayClass(CurrentGamesFarming))
             {
                 for(int i = 0;i < CurrentGamesFarming.count; i++)
                 {
                     NSDictionary *item = CurrentGamesFarming[i];
                     GameFarmItem *farmItem = [[GameFarmItem alloc] init];
                     farmItem.hoursPlayed = [item purifyStringForKey:@"HoursPlayed"];
                     farmItem.appID = [item purifyStringForKey:@"AppID"];
                     farmItem.gameName = [item purifyStringForKey:@"GameName"];
                     farmItem.cardsRemaining = [item purifyStringForKey:@"CardsRemaining"];
                     [_cardFarmerItem.currentGamesFarming addObject:farmItem];
                 }
             }
             NSArray *gameFarmItem = [cardsFarmer purifyObjectForKey:@"GamesToFarm"];
             if(MA_IsKindOfNSArrayClass(gameFarmItem))
             {
                 for(int i = 0;i < gameFarmItem.count; i++)
                 {
                     NSDictionary *item = gameFarmItem[i];
                     GameFarmItem *farmItem = [[GameFarmItem alloc] init];
                     farmItem.hoursPlayed = [item purifyStringForKey:@"HoursPlayed"];
                     farmItem.appID = [item purifyStringForKey:@"AppID"];
                     farmItem.gameName = [item purifyStringForKey:@"GameName"];
                     farmItem.cardsRemaining = [item purifyStringForKey:@"CardsRemaining"];
                     [_cardFarmerItem.gameToFarm addObject:farmItem];
                 }
             }
             
         }
         
     }
    GameFarmItem *farmItem = [[GameFarmItem alloc] init];
    farmItem.hoursPlayed = @"11111";
    farmItem.appID = @"11111";
    farmItem.gameName = @"11111";
    farmItem.cardsRemaining = @"11111";
    [_cardFarmerItem.gameToFarm addObject:farmItem];
    [_cardFarmerItem.currentGamesFarming addObject:farmItem];
//    NSArray *resultArr = [data componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    //    MALog(@"%@", resultArr);

    
    
    
    
}
@end
