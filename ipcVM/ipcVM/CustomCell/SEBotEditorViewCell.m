//
//  SEBotEditorViewCell.m
//  ipcVM
//
//  Created by Sean on 2018/2/8.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEBotEditorViewCell.h"
#import "BotDetailItem.h"

#define RIGHTLABELX  _leftLabel.x + _leftLabel.width + 60.f

@interface SEBotEditorViewCell()

@property(nonatomic,strong)UIView *line;

@property(nonatomic,strong)UILabel *leftLabel;

@property(nonatomic,strong)UILabel  *rightLabel;



@end



@implementation SEBotEditorViewCell
-(UILabel *)leftLabel
{
    if(!_leftLabel)
    {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.font = MANUIFontWithSize(15.f);
        _leftLabel.textColor  = [UIColor blackColor];
    }
    return _leftLabel;
}

-(UILabel *)rightLabel
{
    if(!_rightLabel)
    {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.font = MANUIFontWithSize(15.f);
        _rightLabel.textColor  = [UIColor blackColor];

    }
    return _rightLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpBuildUI];
        //        self.backgroundColor = [UIColor redColor];
    }
    
    return self;
}

-(void)setUpBuildUI
{
    _line= [[UIView alloc] initWithFrame:CGRectMake(0, BOTEDITORITEMHIGHT -1.f, SCREEN_WIDTH, 0.5f)];
    _line.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:_line];
    [self.contentView addSubview:self.leftLabel];
    [self.contentView addSubview:self.rightLabel];
    
    

}


-(void)setStyle:(SEBotEditorViewCellStyle)style
{
    _style = style;
    [self setUpData];
}


-(void)setUpData
{
    switch (_style) {
        case SEBotEditorViewCellBotName:
            _leftLabel.text = @"BotName";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.botName;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            
            break;
        case SEBotEditorViewCellSteamId:
            _leftLabel.text = @"SteamId";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.steamID;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            break;
        case SEBotEditorViewCellKeepRunning:
            _leftLabel.text = @"KeepRunning";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.keepRunning;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            
            
            break;
        case SEBotEditorViewCellAccoutFlags:
            _leftLabel.text = @"AccoutFlags";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.accoutFlags;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            
            
            break;
        case SEBotEditorViewCellAvatarHash:

            
            
            break;
        case SEBotEditorViewCellBotConfig:
            _leftLabel.text = @"SteamId";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.steamID;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            
            
            break;
        case SEBotEditorViewCellCardFarmer:
            _leftLabel.text = @"SteamId";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.steamID;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            
            
            break;
        case SEBotEditorViewCellCardFarmerPaused:
            _leftLabel.text = @"SteamId";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.steamID;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            
            
            break;
        case SEBotEditorViewCellCardFarmerTimeRemaining:
            _leftLabel.text = @"SteamId";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.steamID;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            
            
            break;
        case SEBotEditorViewCellCardFarmerGameToFarm:
            
            
            break;
        case SEBotEditorViewCellCardFarmercurrentGamesFarming:
            
            
            break;
            
        default:
            break;
    }
}
@end
