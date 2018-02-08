//
//  SEBotEditorViewCell.h
//  ipcVM
//
//  Created by Sean on 2018/2/8.
//  Copyright © 2018年 Sean. All rights reserved.
//


#define BOTEDITORITEMHIGHT  55.f
@class BotDetailItem;

typedef NS_ENUM(NSInteger, SEBotEditorViewCellStyle) {
    SEBotEditorViewCellBotName,
    SEBotEditorViewCellSteamId,
    SEBotEditorViewCellKeepRunning,
    SEBotEditorViewCellAccoutFlags,
    SEBotEditorViewCellAvatarHash,
    SEBotEditorViewCellBotConfig,
    SEBotEditorViewCellCardFarmer,
    SEBotEditorViewCellCardFarmerPaused,
    SEBotEditorViewCellCardFarmerTimeRemaining,
    SEBotEditorViewCellCardFarmerGameToFarm,
    SEBotEditorViewCellCardFarmercurrentGamesFarming,
 
};
@interface SEBotEditorViewCell : UITableViewCell
@property(nonatomic,assign)SEBotEditorViewCellStyle  style;

@property(nonatomic,strong)BotDetailItem   *botDetailItem;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


@end
