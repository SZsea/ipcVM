//
//  BotConfigItem.h
//  ipcVM
//
//  Created by Sean on 2018/2/6.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "ItemBase.h"

@interface BotConfigItem : ItemBase


@property(nonatomic,copy)NSString *AcceptGifts;

/*
 AcceptGifts - bool type with default value of false. When enabled, ASF will automatically accept and redeem all steam gifts received by the bot. This includes also gifts from users different than defined in SteamUserPermissions. This option is recommended only for alt accounts, as it's very likely that you don't want to automatically redeem all gifts sent to your primary account. Keep in mind that gifts sent to e-mail address are not directly forwarded to the client, so ASF won't accept those gifts (without your help), therefore you should be sending steam gifts to your bots directly. If you're unsure whether you want this feature enabled or not, keep it with default value of false.
 */

@property(nonatomic,copy)NSString *AutoSteamSaleEvent;

/*
 AutoSteamSaleEvent - bool type with default value of false. During Steam summer/winter sale events Steam is known for providing you extra cards for browsing discovery queue each day, as well as voting in the Steam awards. When this option is enabled, ASF will automatically check Steam discovery queue and Steam awards each 6 hours, and clear them if needed. This option is not recommended if you want to do those actions yourself, and typically it should make sense only on bot accounts. Moreover, you need to ensure that your account is at least of level 8 if you expect to receive those cards in the first place. If you're unsure whether you want this feature enabled or not, keep it with default value of false.
 
 Please note that due to constant Valve issues, changes and problems, we give no guarantee whether this function will work properly, therefore it's entirely possible that this option will not work at all. We do not accept any bug reports, neither support requests for this option. It's offered with absolutely no guarantees, you're using it at your own risk.
 */

@property(nonatomic,copy)NSString *CustomGamePlayedWhileFarming;

/*
 CustomGamePlayedWhileFarming - string type with default value of null. When ASF is farming, it can display itself as "Playing non-steam game: CustomGamePlayedWhileFarming" instead of currently farmed game. This can be useful if you would like to let your friends know that you're farming, yet you don't want to use FarmOffline feature. Please note that ASF cannot guarantee the actual display order of Steam network, therefore this is only a suggestion that may, or may not, display properly. Default value of null disables this feature.
 */

@property(nonatomic,copy)NSString *CustomGamePlayedWhileIdle;

/*
 CustomGamePlayedWhileIdle - string type with default value of null. Similar to CustomGamePlayedWhileFarming, but for the situation when ASF has nothing to do (as account is fully farmed). Default value of null disables this feature.
 */

@property(nonatomic,copy)NSString *DismissInventoryNotifications;

/*
 DismissInventoryNotifications - bool type with default value of false. Every card drop triggers inventory notification - steam notification telling you that you received new items. This can get annoying pretty fast, and serves little to no purpose, therefore ASF offers dismissing those notifications automatically. When you enable this option, ASF will automatically dismiss all notifications related to new items being received - this also includes items you obtained through trading and other ways. Of course, this option affects only inventory notifications, so all other notification types, e.g. profile comments notifications, will stay in-tact.
 */

@property(nonatomic,copy)NSString *Enabled;

/*
 Enabled - bool type with default value of false. This property defines if bot is enabled. Enabled bot instance (true) will automatically start on ASF run, while disabled bot instance (false) will need to be !started manually. By default every bot is disabled, so you probably want to switch this property to true for all of your bots that should be started automatically.
 */
@property(nonatomic,copy)NSString *FarmingOrder;

/*
 FarmingOrder - byte type with default value of 0. This property defines the preferred farming order of ASF. Currently there are following farming orders available:
 Value     Name     Description
 0     Unordered     No sorting, slightly improving CPU performance
 1     AppIDsAscending     Try to farm games with lowest appIDs first
 2     AppIDsDescending     Try to farm games with highest appIDs first
 3     CardDropsAscending     Try to farm games with lowest number of card drops remaining first
 4     CardDropsDescending     Try to farm games with highest number of card drops remaining first
 5     HoursAscending     Try to farm games with lowest number of hours played first
 6     HoursDescending     Try to farm games with highest number of hours played first
 7     NamesAscending     Try to farm games in alphabetical order, starting from A
 8     NamesDescending     Try to farm games in reverse alphabetical order, starting from Z
 9     Random     Try to farm games in totally random order
 10     BadgeLevelsAscending     Try to farm games with lowest badge levels first
 11     BadgeLevelsDescending     Try to farm games with highest badge levels first
 12     RedeemDateTimesAscending     Try to farm oldest games on our account first
 13     RedeemDateTimesDescending     Try to farm newest games on our account first
 
 Notice the word "try" in all above descriptions - the actual order is heavily affected by selected cards farming algorithm and sorting will affect only results that ASF considers same performance-wise. For example, in Simple algorithm, selected FarmingOrder should be entirely respected in current farming session (as every game is treated the same), while in Complex algorithm actual order is affected by hours and then sorted according to chosen FarmingOrder. This will lead to different results, as post-HoursUntilCardDrops games have higher priority over pre-HoursUntilCardDrops ones. It effectively means that ASF will idle post-HoursUntilCardDrops in your FarmingOrder first, then adapting your FarmingOrder for choosing the next batch. Therefore, this config property is only a suggestion that ASF will try to respect, as long as it doesn't affect performance negatively (in this case, ASF will prefer performance over FarmingOrder).
 
 There is also idling priority queue that is accessible through !iq commands. If it's used, actual idling order is sorted firstly by performance, then by idling queue, and finally by FarmingOrder.
 */
@property(nonatomic,copy)NSString *FarmOffline;

/*
 FarmOffline - bool type with default value of false. Offline farming is extremely useful for primary accounts. As you should know, farming a game actually shows your steam status as "Playing game: XXX", which can be misleading to your friends, confusing them that you're playing a game while actually you're only farming it. Offline farming solves that issue - your account will never be shown as "in-game" when you're farming steam cards with ASF. This is possible thanks to the fact that ASF does not have to "sign in" into Steam Community in order to work properly, so we're in fact playing those games, but in "semi-offline" mode. Keep in mind that played games using offline farming will still count toward your playtime, and show as "recently played" on your profile. In addition to that, this feature is also important if you want to receive notifications and unread messages, if you keep ASF open while not keeping Steam client open at the same time. This is because ASF acts as a Steam client itself, and you're not receiving e.g. unread messages if in fact your account is online for the entire time and receiving messages through ASF - farming offline in this case is extremely useful, as all messages that arrive while you were offline, even if ASF is running (farming offline), are properly marked as unread and forwarded to you when you come back. Also, bots with FarmOffline feature enabled can't react to commands (directly), which is important if you decide to use that feature with alt accounts (see: HandleOfflineMessages). If you're unsure whether you want this feature enabled or not, it's suggested to use a value of true for primary accounts, and false otherwise.
 */
@property(nonatomic,strong)NSMutableArray *GamesPlayedWhileIdle;

/*
 GamesPlayedWhileIdle - HashSet<uint> type with default value of being empty. If ASF has nothing to farm it can play your specified steam games (appIDs) instead. Playing games in such manner increases your "hours played" of those games, but nothing else apart of it. This feature can be enabled at the same time with CustomGamePlayedWhileIdle in order to play your selected games while showing custom status in Steam network, but in this case, like in CustomGamePlayedWhileFarming case, the actual display order is not guaranteed. Please note that Steam allows ASF to play only up to 32 appIDs, therefore if you put more games than that, only first 32 will be respected (and extra ones being ignored).
 */
@property(nonatomic,copy)NSString *HandleOfflineMessages;

/*
 HandleOfflineMessages - bool type with default value of false. When FarmOffline feature is enabled, bot is not able to receive commands in usual way, as it's not logged into Steam Community. To overcome this problem, ASF has also support for Steam offline messages that can be activated here. If you use FarmOffline on your alt accounts, you can consider switching this property to true in order to still be able to send commands to your offline bots, and receive responses. Keep in mind that this feature is based on offline steam messages, and receiving them automatically marks them as read, therefore this option is NOT recommended for primary accounts, as ASF will be forced to read and mark all offline messages as received in order to listen for offline commands - this affects also offline messages from your friends that are not ASF commands.
 
  It's also worth mentioning that this option is basically a hack that might, or might not work correctly, based on whether Steam network actually will save those unread messages as offline messages in the first place. We've already seen many situations when it did not, so it's entirely possible that your bot won't receive your commands regardless, unless you disable FarmOffline altogether. If you're unsure whether you want this feature enabled or not, keep it with default value of false.
 */
@property(nonatomic,copy)NSString *HoursUntilCardDrops;

/*
 HoursUntilCardDrops - byte type with default value of 3. This property defines if account has card drops restricted, and if yes, for how many initial hours. Restricted card drops means that account is not receiving any card drops from given game until the game is played for at least HoursUntilCardDrops hours. Unfortunately there is no magical way to detect that, so ASF relies on you. This property affects cards farming algorithm that will be used. Setting this property properly will maximize profits and minimize time required for cards to be farmed. Remember that there is no obvious answer whether you should use one or another value, since it fully depends on your account. It seems that older accounts which never asked for refund have unrestricted card drops, so they should use a value of 0, while new accounts and those who did ask for refund have restricted card drops with a value of 3. This is however only theory, and should not be taken as a rule. The default value for this property was set based on "lesser evil" and majority of use cases.
 */
@property(nonatomic,copy)NSString *IdleRefundableGames;

/*
 IdleRefundableGames - bool type with default value of true. This property defines if ASF is permitted to idle games that are still refundable. A refundable game is a game that we bought in last 2 weeks through Steam Store and we didn't play it for longer than 2 hours yet, as stated here. By default when this option is set to true, ASF ignores Steam refunds entirely and idles everything, as most people expect. However, you can change this option to false if you want to ensure that ASF won't idle any of your refundable games too soon, allowing you to evaluate those games yourself and refund if needed without worrying about ASF affecting playtime negatively. Please note that if you disable this option then games you purchased from Steam Store won't be idled by ASF for up to 14 days since redeem date. If you're unsure whether you want this feature enabled or not, keep it with default value of true.
 */
@property(nonatomic,copy)NSString *IsBotAccount;

/*
 IsBotAccount - bool type with default value of false. This property defines if account used for this bot instance should be considered a primary one (false), or bot/alt one (true). ASF tries to be as much compatible with both types as possible, therefore switching this option to true for alts is not technically required for ASF to work, but doing so will allow ASF to tune the logic better for alt accounts. At the moment, it affects following things:
 Event     IsBotAccount: false     IsBotAccount: true
 Invalid trades     Ignored     Rejected
 Invalid friend/clan invites     Ignored     Rejected
 
 For example, invalid trades will be ignored on primary accounts, which allows you to decide yourself if you want to accept/decline them or not. On bot accounts, those trades will be immediately rejected, as there is nobody taking care of them.
 
 Invalid friend invite is the one that doesn't come from user with FamilySharing permission or above. Likewise - invalid clan invite is the one that doesn't come from SteamMasterClanID.
 
 The logic might get extended in future releases if needed. If you're not sure how to set this property, leave it with default value of false.
 */
@property(nonatomic,strong)NSMutableArray *LootableTypes;

/*
 LootableTypes - HashSet<byte> type with default value of 1, 3, 5 steam item types. This property defines ASF behaviour when looting - both manual and automatic. ASF will ensure that only items from LootableTypes will be included in a trade offer, therefore this property allows you to choose what you want to receive in a trade offer that is being sent to you.
 Value     Name     Description
 0     Unknown     Every type that doesn't fit in any of the below
 1     BoosterPack     Unpacked booster pack
 2     Emoticon     Emoticon to use in Steam Chat
 3     FoilTradingCard     Foil variant of TradingCard
 4     ProfileBackground     Profile background to use on your Steam profile
 5     TradingCard     Steam trading card, being used for crafting badges (non-foil)
 6     SteamGems     Steam gems being used for crafting boosters, sacks included
 
 Please note that regardless of the settings above, ASF will only ask for Steam (appID of 753) community (contextID of 6) items, so all game items, gifts and likewise, are excluded from the trade offer by definition.
 
 Default ASF setting is based on most common usage of the bot, with looting only booster packs, and trading cards (including foils). The property defined here allows you to alter that behaviour in whatever way that satisfies you. Please keep in mind that all types not defined above will show as Unknown type, which is especially important when Valve releases some new Steam item, that will be marked as Unknown by ASF as well, until it's added here (in the future release). That's why in general it's not recommended to include Unknown type in your LootableTypes, unless you know what you're doing, and you also understand that ASF will send your entire inventory in a trade offer if Steam Network gets broken again and reports all your items as Unknown. My strong suggestion is to not include Unknown type in the LootableTypes, even if you expect to loot everything.
 */
@property(nonatomic,strong)NSMutableArray *MatchableTypess;

/*
 MatchableTypes - HashSet<byte> type with default value of 5 Steam item types. This property defines which Steam item types are permitted to be matched when SteamTradeMatcher option in TradingPreferences is enabled. Types are defined as below:
 Value     Name     Description
 0     Unknown     Every type that doesn't fit in any of the below
 1     BoosterPack     Unpacked booster pack
 2     Emoticon     Emoticon to use in Steam Chat
 3     FoilTradingCard     Foil variant of TradingCard
 4     ProfileBackground     Profile background to use on your Steam profile
 5     TradingCard     Steam trading card, being used for crafting badges (non-foil)
 6     SteamGems     Steam gems being used for crafting boosters, sacks included
 
 Of course, types that you should use for this property typically include only 2, 3, 4 and 5, as only those types are supported by STM. Please note that ASF is not a trading bot and will NOT care about price or rarity, which means that if you use it e.g. with Emoticon type, then ASF will be happy to trade your 2x rare emoticon for 1x rare 1x common, as that makes progress towards badge (in this case emoticons) completion. Please evaluate twice if you're fine with that. Unless you know what you're doing, you should keep it with default value of 5.
 */
@property(nonatomic,copy)NSString *PasswordFormat;

/*
 PasswordFormat - byte type with default value of 0. This property defines the format of SteamPassword property, and currently supports - 0 for PlainText, 1 for AES and 2 for ProtectedDataForCurrentUser. Please refer to Security section if you want to learn more, as you'll need to ensure that SteamPassword property indeed includes password in matching PasswordFormat. Unless you know what you're doing, you should keep it with default value of 0.
 */
@property(nonatomic,copy)NSString *Paused;

/*
 Paused - bool type with default value of false. This property defines initial state of CardsFarmer module. With default value of false, bot will automatically start farming when it's started, either because of Enabled or !start command. Switching this property to true should be done only if you want to manually !resume automatic farming process, for example because you want to use !play all the time and never use automatic CardsFarmer module - this works exactly the same as !pause command. If you're unsure whether you want this feature enabled or not, keep it with default value of false.
 */
@property(nonatomic,copy)NSString *RedeemingPreferences;

/*
 RedeemingPreferences - byte flags type with default value of 0. This property defines ASF behaviour when redeeming cd-keys, and is defined as below:
 Value     Name     Description
 0     None     No redeeming preferences, typical
 1     Forwarding     Forward keys unavailable to redeem to other bots
 2     Distributing     Distribute all keys among itself and other bots
 4     KeepMissingGames     Keep keys for (potentially) missing games when forwarding, leaving them unused
 
 Please notice that this property is flags field, therefore it's possible to choose any combination of available values. Check out flags mapping if you'd like to learn more. Not enabling any of flags results in None option.
 
 Forwarding will cause bot to forward a key that is not possible to redeem, to another connected and logged on bot that is missing that particular game (if possible to check). The most common situation is forwarding AlreadyPurchased game to another bot that is missing that particular game, but this option also covers other scenarios, such as DoesNotOwnRequiredApp, RateLimited or RestrictedCountry.
 
 Distributing will cause bot to distribute all received keys among itself and other bots. This means that every bot will get a single key from the batch. Typically this is used only when you're redeeming many keys for the same game, and you want to evenly distribute them among your bots, as opposed to redeeming keys for various different games. This feature makes no sense if you're redeeming only one key in a single !redeem action (as there are no extra keys to be distributed).
 
 KeepMissingGames will cause bot to skip Forwarding when we can't be sure if key being redeemed is in fact owned by our bot, or not. This basically means that Forwarding will apply only to AlreadyPurchased keys, instead of covering also other cases such as DoesNotOwnRequiredApp, RateLimited or RestrictedCountry. Typically you might want to use this option on primary account, to ensure that keys being redeemed on it won't be forwarded further if your bot for example becomes temporarily RateLimited. As you can guess from the description, this field has absolutely no effect if Forwarding is not enabled.
 
 Enabling both Forwarding and Distributing will add distributing feature on top of forwarding one, which makes ASF trying to redeem one key on all bots firstly (forwarding) before moving to the next one (distributing). Typically you want to use this option only when you want Forwarding, but with altered behaviour of switching the bot on key being used, instead of always going in-order with every key (which would be Forwarding alone). This behaviour can be beneficial if you know that majority or even all of your keys are tied to the same game, because in this situation Forwarding alone would try to redeem everything on one bot firstly (which makes sense if your keys are for unique games), and Forwarding + Distributing will switch the bot on the next key, "distributing" the task of redeeming new key onto another bot than the initial one (which makes sense if keys are for the same game, skipping one pointless attempt per key).
 
 The actual bots order for all of the redeeming scenarios is alphabetical, excluding bots that are unavailable (not connected, stopped or likewise). Please keep in mind that there is per-IP and per-account hourly limit of redeeming tries, and every redeem try that didn't end with OK contributes to failed tries. ASF will do its best to minimize number of AlreadyPurchased failures, e.g. by trying to avoid forwarding a key to another bot that already owns that particular game, but it's not always guaranteed to work due to how Steam is handling licenses. Using redeeming flags such as Forwarding or Distributing will always increase your likehood to hit RateLimited.
 */
@property(nonatomic,copy)NSString *SendOnFarmingFinished;

/*
 SendOnFarmingFinished - bool type with default value of false. When ASF is done with farming given account, it can automatically send steam trade containing everything farmed up to this point to user with Master permission, which is very convenient if you don't want to bother with trades yourself. This option works the same as !loot command, therefore keep in mind that it requires user with Master permission set, you might also require valid SteamTradeToken, including using an account that is actually eligible for trading. In addition to initiating !loot after finishing farming, ASF will also initiate !loot on each new items notification (when not farming), and after completing each trade that results in new items (always) when this option is active. This is especially useful for "forwarding" items received from other people to our account. It's strongly recommended to use this feature together with ASF 2FA being set, as there is no point in sending automatic trades if you need to manually confirm them. If you're not sure how to set this property, leave it with default value of false.
 */
@property(nonatomic,copy)NSString *SendTradePeriod;

/*
 SendTradePeriod - byte type with default value of 0. This property works very similar to SendOnFarmingFinished property, with one difference - instead of sending trade when farming is done, we can also send it every SendTradePeriod hours, regardless of how much we have to farm left. This is useful if you want to !loot your alt accounts on usual basis instead of waiting for it to finish farming. Default value of 0 disables this feature, if you want your bot to send you trade e.g. every day, you should put 24 here. It's strongly recommended to use this feature together with ASF 2FA being set, as there is no point in sending automatic trades if you need to manually confirm them. If you're not sure how to set this property, leave it with default value of 0.
 */
@property(nonatomic,copy)NSString *ShutdownOnFarmingFinished;

/*
 ShutdownOnFarmingFinished - bool type with default value of false. ASF is "occupying" an account for the whole time of process being active. When given account is done with farming, ASF periodically checks it (every IdleFarmingPeriod hours), if perhaps some new games with steam cards were added in the meantime, so it can resume farming of that account without a need to restart the process. This is useful for majority of people, as ASF can automatically resume farming when needed. However, you may actually want to stop the process when given account is fully farmed, you can achieve that by setting this property to true. When enabled, ASF will proceed with logging off when account is fully farmed, which means that it won't be periodically checked or occupied anymore. You should decide yourself if you prefer ASF to work on given bot instance for the whole time, or if perhaps ASF should stop it when farming process is done. When all accounts are stopped and process is not running in --server mode, ASF will shutdown as well. If you're not sure how to set this property, leave it with default value of false.
 */
@property(nonatomic,copy)NSString *SteamLogin;

/*
 SteamLogin - string type with default value of null. This property defines your steam login - the one you use for logging in to steam. In addition to defining steam login here, you may also keep default value of null if you want to enter your steam login on each ASF startup instead of putting it in the config. This may be useful for you if you don't want to save sensitive data in config file.
 */
@property(nonatomic,copy)NSString *SteamMasterClanID;

/*
 SteamMasterClanID - ulong type with default value of 0. This property defines the steamID of the steam group that bot should automatically join, including group chat. You can check steamID of your group by navigating to its page, then adding /memberslistxml/?xml=1 to the end of the link, so the link will look like this. Then you can get steamID of your group from the result, it's in <groupID64> tag. In above example it would be 103582791440160998. If you don't have any "farm group" for your bots, you should keep it at default.
 */
@property(nonatomic,copy)NSString *SteamParentalPIN;

/*
 SteamParentalPIN - string type with default value of 0. This property defines your steam parental PIN. ASF requires an access to resources protected by steam parental, therefore if you use that feature, you need to provide ASF with parental unlock PIN, so it can operate normally. Default value of 0 means that there is no steam parental PIN required to unlock this account, and this is probably what you want if you don't use steam parental functionality. In addition to defining steam parental PIN here, you may also use value of null if you want to enter your steam parental PIN on each ASF startup instead of putting it in the config. This may be useful for you if you don't want to save sensitive data in config file.
 */
@property(nonatomic,copy)NSString *SteamPassword;

/*
 SteamPassword - string type with default value of null. This property defines your steam password - the one you use for logging in to steam. In addition to defining steam password here, you may also keep default value of null if you want to enter your steam password on each ASF startup instead of putting it in the config. This may be useful for you if you don't want to save sensitive data in config file.
 */
@property(nonatomic,copy)NSString *SteamTradeToken;

/*
 SteamTradeToken - string type with default value of null. When you have your bot on your friend list, then bot can send a trade to you right away without worrying about trade token, therefore you can leave this property at default value of null. If you however decide to NOT have your bot on your friend list, then you will need to generate and fill a trade token as the user that this bot is expecting to send trades to. In other words, this property should be filled with trade token of the account that is defined with Master permission in SteamUserPermissions of this bot instance.
 
 In order to find your token, as logged in user with Master permission, navigate here and take a look at your trade URL. The token we're looking for is made out of 8 characters after &token= part in your trade URL. You should copy and put those 8 characters here, as SteamTradeToken. Do not include whole trading URL, neither &token= part, only token itself.
 */
@property(nonatomic,strong)NSDictionary *SteamUserPermissions;

/*
 SteamUserPermissions - Dictionary<ulong, byte> type with default value of being empty. This property is a dictionary property which maps given Steam user identified by his 64-bit steam ID, to byte number that specifies his permission in ASF instance. Currently available bot permissions in ASF are defined as:
 Value     Name     Description
 0     None     No permission, this is mainly a reference value that is assigned to steam IDs missing in this dictionary - there is no need to define anybody with this permission
 1     FamilySharing     Provides minimum access for family sharing users. Once again, this is mainly a reference value since ASF is capable of automatically discovering steam IDs that we permitted for using our library
 2     Operator     Provides basic access to given bot instances, mainly adding licenses and redeeming keys
 3     Master     Provides full access to given bot instance
 
 In short, this property allows you to handle permissions for given users. Permissions are important mainly for access to ASF commands, but also for enabling many ASF features, such as accepting trades. For example you might want to set your own account as Master, and give Operator access to 2-3 of your friends so they can easily redeem keys for your bot with ASF, while not being eligible e.g. for !stopping it. Thanks to that you can easily assign permissions to given users and let them use your bot to some specified by you degree.
 
 We recommend to set exactly one user as Master, and any amount you wish as Operators and below. While it's technically possible to set multiple Masters and ASF will work correctly with them, for example by accepting all of their trades sent to the bot, ASF will use only one of them (with lowest steam ID) for every action that requires a single target, for example a !loot request, so also properties like SendOnFarmingFinished or SendTradePeriod. If you perfectly understand those limitations, especially the fact that !loot request will always send items to the Master with lowest steam ID, regardless of the Master that actually executed the command, then you can define multiple users with Master permission here, but we still recommend a single master scheme - multiple masters scheme is discouraged setup that is not supported.
 
 It's nice to note that there is one more extra Owner permission, which is declared as SteamOwnerID global config property. You can't assign Owner permission to anybody here, as SteamUserPermissions property defines only permissions that are related to the bot instance, and not ASF as a process.
 */
@property(nonatomic,copy)NSString *TradingPreferences;

/*
 TradingPreferences - byte flags type with default value of 0. This property defines ASF behaviour when in trading, and is defined as below:
 Value     Name     Description
 0     None     No trading preferences - accepts only Master trades
 1     AcceptDonations     Accepts trades in which we're not losing anything
 2     SteamTradeMatcher     Accepts dupes-matching STM-like trades. Visit trading for more info
 4     MatchEverything     Requires SteamTradeMatcher to be set, and in combination with it - also accepts bad trades in addition to good and neutral ones
 8     DontAcceptBotTrades     Doesn't automatically accept !loot trades from other bot instances
 
 Please notice that this property is flags field, therefore it's possible to choose any combination of available values. Check out flags mapping if you'd like to learn more. Not enabling any of flags results in None option.
 
 For further explanation of ASF trading logic, and description of every available flag, please visit Trading section.
 */
@property(nonatomic,copy)NSString *UseLoginKeys;

/*
 UseLoginKeys - bool type with default value of true. This property defines if ASF should use login keys mechanism for this Steam account. Login keys mechanism works very similar to official Steam client's "remember me" option, which makes it possible for ASF to store and use temporary one-time use login key for next logon attempt, effectively skipping a need of providing password, Steam Guard or 2FA code as long as our login key is valid. Login key is stored in BotName.db file and updated automatically. This is why you don't need to provide password/SteamGuard/2FA code after logging in successfully with ASF just once.
 
 Login keys are used by default for your convenience, so you don't need to input SteamPassword, SteamGuard or 2FA code (when not using ASF 2FA) on each login. It's also superior alternative since login key can be used only for a single time and does not reveal your original password in any way. Exactly the same method is being used by your original Steam client, which saves your account name and login key for your next logon attempt, effectively being the same as using SteamLogin with UseLoginKeys and empty SteamPassword in ASF.
 
 However, some people might be concerned even about this little detail, therefore this option is available here for you if you'd like to ensure that ASF won't store any kind of token that would allow resuming previous session after being closed, which will result in full authentication being mandatory on each login attempt. Disabling this option will work exactly the same as not checking "remember me" in official Steam client. Unless you know what you're doing, you should keep it with default value of true.

 */

@end
