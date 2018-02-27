//
//  BotConfigItem.m
//  ipcVM
//
//  Created by Sean on 2018/2/6.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "BotConfigItem.h"

@implementation BotConfigItem


-(instancetype)init
{
    if(self = [super init])
    {
        _AcceptGifts = @"false";
        _AutoSteamSaleEvent = @"false";
        _CustomGamePlayedWhileFarming = @"";
        _CustomGamePlayedWhileIdle = @"";
        _DismissInventoryNotifications = @"false";
        _Enabled = @"false";
        _FarmingOrder = @"0";
        _FarmOffline = @"false";
        _GamesPlayedWhileIdle = [NSMutableArray new];
        _HandleOfflineMessages = @"false";
        _HoursUntilCardDrops = @"3";
        _IdleRefundableGames = @"true";
        _IsBotAccount = @"false";
        _LootableTypes = [[NSMutableArray alloc] initWithObjects:@"1",@"3",@"5", nil];
        _MatchableTypess = [[NSMutableArray alloc] initWithObjects:@"5", nil];
        _PasswordFormat = @"0";
        _Paused = @"false";
        _RedeemingPreferences = @"0";
        _SendOnFarmingFinished = @"false";
        _SendTradePeriod = @"0";
        _ShutdownOnFarmingFinished = @"false";
        _SteamLogin = @"";
        _SteamMasterClanID = @"0";
        _SteamParentalPIN = @"0";
        _SteamPassword = @"";
        _SteamTradeToken = @"";
        _SteamUserPermissions = [NSMutableDictionary new];
        _TradingPreferences = @"0";
        _UseLoginKeys = @"true";
    }
    return self;
}
@end
