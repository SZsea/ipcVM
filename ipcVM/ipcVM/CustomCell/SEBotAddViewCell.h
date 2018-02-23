//
//  SEBotAddViewCell.h
//  ipcVM
//
//  Created by Sean on 2018/2/22.
//  Copyright © 2018年 Sean. All rights reserved.
//
#define BOTADDITEMHIGHT  55.f
@class BotDetailItem;
@interface SEBotAddViewCell : UITableViewCell
typedef NS_ENUM(NSInteger, SEBotAddViewCellStyle) {
    SEBotAddViewCellBotName,
    SEBotAddViewCellBotConfig,
};

@property(nonatomic,assign)SEBotAddViewCellStyle  style;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withbot:(BotDetailItem *)botConfigItem;

@end
