//
//  SEBotAddViewCell.m
//  ipcVM
//
//  Created by Sean on 2018/2/22.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEBotAddViewCell.h"
#import "SEBotConfigView.h"
#import "BotDetailItem.h"
@interface SEBotAddViewCell()

@property(nonatomic,strong)UIView *line;

@property(nonatomic,strong)SEBotConfigView  *configView;

@property(nonatomic,strong)BotDetailItem  *botConfigItem;
@end
@implementation SEBotAddViewCell
- (SEBotConfigView *)configView
{
    if(!_configView)
    {
        _configView = [[SEBotConfigView alloc] initWithBot:_botConfigItem.botConfigItem];
        _configView.hidden = YES;
    }
    return _configView;
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withbot:(BotDetailItem *)botConfigItem{
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _botConfigItem = botConfigItem;
        [self setUpBuildUI];
        //        self.backgroundColor = [UIColor redColor];
    }
    
    return self;
}

-(void)setUpBuildUI
{
    _line= [[UIView alloc] initWithFrame:CGRectMake(0, BOTADDITEMHIGHT -1.f, SCREEN_WIDTH, 0.5f)];
    _line.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:_line];
    [self.contentView addSubview:self.configView];

    
}

-(void)setStyle:(SEBotAddViewCellStyle)style
{
    _style = style;
    [self p_setUpData];
}

-(void)p_setUpData
{
    switch (_style) {
        case SEBotAddViewCellBotName:
            _configView.hidden = YES;
            _line.hidden = NO;
            break;
        case SEBotAddViewCellBotConfig:
            _configView.hidden = NO;
            _line.hidden = YES;
//            self.contentView.backgroundColor = [UIColor redColor];
            break;
        default:
            break;
    }
}
@end
