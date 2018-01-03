//
//  SEMenuTableViewCell.h
//  ipcVM
//
//  Created by Sean on 2018/1/3.
//  Copyright © 2018年 Sean. All rights reserved.
//


@class BotItem;

#define BOTITEMHIGHT  64.f
@interface SEMenuTableViewCell : UITableViewCell

@property (nonatomic,strong)BotItem *item;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


@end
