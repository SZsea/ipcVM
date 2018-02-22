//
//  SEBotEditorViewCell.m
//  ipcVM
//
//  Created by Sean on 2018/2/8.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEBotEditorViewCell.h"
#import "BotDetailItem.h"
#import "CardFarmerItem.h"
#import "GameFarmItem.h"

#define RIGHTLABELX  _leftLabel.x + _leftLabel.width + 60.f
#define RIGHTLABELXMAX  SCREEN_WIDTH/2;
@interface SEBotEditorViewCell()

@property(nonatomic,strong)UIView *line;

@property(nonatomic,strong)UILabel *leftLabel;

@property(nonatomic,strong)UILabel  *rightLabel;

@property(nonatomic,strong)UILabel *leftLabelA;

@property(nonatomic,strong)UILabel  *rightLabelA;

@property(nonatomic,strong)UILabel *leftLabelB;

@property(nonatomic,strong)UILabel  *rightLabelB;

@property(nonatomic,strong)UILabel *leftLabelC;

@property(nonatomic,strong)UILabel  *rightLabelC;


@end



@implementation SEBotEditorViewCell
-(UILabel *)leftLabelA
{
    if(!_leftLabelA)
    {
        _leftLabelA = [[UILabel alloc] init];
        _leftLabelA.font = MANUIFontWithSize(15.f);
        _leftLabelA.textColor  = [UIColor blackColor];
    }
    return _leftLabelA;
}

-(UILabel *)rightLabelA
{
    if(!_rightLabelA)
    {
        _rightLabelA = [[UILabel alloc] init];
        _rightLabelA.font = MANUIFontWithSize(15.f);
        _rightLabelA.textColor  = [UIColor blackColor];

    }
    return _rightLabelA;
}

-(UILabel *)leftLabelB
{
    if(!_leftLabelB)
    {
        _leftLabelB = [[UILabel alloc] init];
        _leftLabelB.font = MANUIFontWithSize(15.f);
        _leftLabelB.textColor  = [UIColor blackColor];
    }
    return _leftLabelB;
}

-(UILabel *)rightLabelB
{
    if(!_rightLabelB)
    {
        
        _rightLabelB = [[UILabel alloc] init];
        _rightLabelB.font = MANUIFontWithSize(15.f);
        _rightLabelB.textColor  = [UIColor blackColor];
        
    }
    return _rightLabelB;
}

-(UILabel *)leftLabelC
{
    if(!_leftLabelC)
    {
        _leftLabelC = [[UILabel alloc] init];
        _leftLabelC.font = MANUIFontWithSize(15.f);
        _leftLabelC.textColor  = [UIColor blackColor];
    }
    return _leftLabelC;
}

-(UILabel *)rightLabelC
{
    if(!_rightLabelC)
    {
        _rightLabelC = [[UILabel alloc] init];
        _rightLabelC.font = MANUIFontWithSize(15.f);
        _rightLabelC.textColor  = [UIColor blackColor];
        
    }
    return _rightLabelC;
}

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
    [self.contentView addSubview:self.leftLabelA];
    [self.contentView addSubview:self.rightLabelA];
    [self.contentView addSubview:self.leftLabelB];
    [self.contentView addSubview:self.rightLabelB];
    [self.contentView addSubview:self.leftLabelC];
    [self.contentView addSubview:self.rightLabelC];
    
    

}


-(void)setStyle:(SEBotEditorViewCellStyle)style
{
    _style = style;
    [self setUpData];
}


-(void)setUpData
{
    _leftLabelA.text = _rightLabelA.text = _leftLabelB.text = _rightLabelB.text = _leftLabelC.text = _rightLabelC.text = nil;
    self.backgroundColor = [UIColor clearColor];
    _line.y = BOTEDITORITEMHIGHT -1.f;
    _line.x = 0.f;
    switch (_style) {
        case SEBotEditorViewCellBotName:
            _leftLabel.text = @"BotName:";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.botName;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            
            break;
        case SEBotEditorViewCellSteamId:
            _leftLabel.text = @"SteamId:";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.steamID;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            
            _line.x = 15.f;
            break;
        case SEBotEditorViewCellKeepRunning:
            _leftLabel.text = @"KeepRunning:";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.keepRunning;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            
            _line.x = 15.f;
            
            
            break;
        case SEBotEditorViewCellAccoutFlags:
            _leftLabel.text = @"AccoutFlags:";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.accoutFlags;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            
            _line.x = 15.f;
            
            
            break;
        case SEBotEditorViewCellAvatarHash:

            
            
            break;
        case SEBotEditorViewCellBotConfig:
            _leftLabel.text = @"BotConfig";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.centerX = SCREEN_WIDTH/2;
            self.backgroundColor = MAColorWithStr(@"#FFFFE0");


            
            break;
        case SEBotEditorViewCellCardFarmer:
            _leftLabel.text = @"CardFarmer";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.centerX = SCREEN_WIDTH/2;
            self.backgroundColor = MAColorWithStr(@"#FFFFE0");

            
            
            break;
        case SEBotEditorViewCellCardFarmerPaused:
            _leftLabel.text = @"Paused:";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.cardFarmerItem.paused;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            _line.x = 15.f;
            
            
            break;
        case SEBotEditorViewCellCardFarmerTimeRemaining:
            _leftLabel.text = @"TimeRemaining:";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text =  _botDetailItem.cardFarmerItem.timeRemaining;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
            _line.x = 15.f;
            
            
            break;
        case SEBotEditorViewCellCardFarmerGameToFarm:
            _leftLabel.text = @"GamesToFarm:";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text = [NSString stringWithFormat:@"%lu",_botDetailItem.cardFarmerItem.gameToFarm.count];
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
             _line.x = 15.f;

            break;
        case SEBotEditorViewCellCardFarmercurrentGamesFarming:
            _leftLabel.text = @"CurrentGamesFarming:";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/2;
            _leftLabel.x = 15.f;
            
            _rightLabel.text = [NSString stringWithFormat:@"%lu",_botDetailItem.cardFarmerItem.currentGamesFarming.count];
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELX;
             _line.x = 15.f;
            break;
        case SEBotEditorViewCellCardFarmerGameToFarmItem: case SEBotEditorViewCellCardFarmercurrentGamesFarmingItem:
            _leftLabel.text = @"appID:";
            [_leftLabel sizeToFit];
            _leftLabel.centerY = BOTEDITORITEMHIGHT/8;
            _leftLabel.x = 30.f;
            
            _rightLabel.text = _gameFarmItem.appID;
            [_rightLabel sizeToFit];
            _rightLabel.centerY = _leftLabel.centerY;
            _rightLabel.x = RIGHTLABELXMAX;
            
            _leftLabelA.text = @"GameName:";
            [_leftLabelA sizeToFit];
            _leftLabelA.y = _leftLabel.y + _leftLabel.height + 5.f;
            _leftLabelA.x = _leftLabel.x;
            
            _rightLabelA.text = _gameFarmItem.gameName;
            [_rightLabelA sizeToFit];
            _rightLabelA.centerY = _leftLabelA.centerY;
            _rightLabelA.x = RIGHTLABELXMAX;
            
            _leftLabelB.text = @"HoursPlayed:";
            [_leftLabelB sizeToFit];
            _leftLabelB.y = _leftLabelA.y + _leftLabelA.height + 5.f;
            _leftLabelB.x = _leftLabelA.x;
            
            _rightLabelB.text = _gameFarmItem.hoursPlayed;
            [_rightLabelB sizeToFit];
            _rightLabelB.centerY = _leftLabelB.centerY;
            _rightLabelB.x = RIGHTLABELXMAX;
            
            _leftLabelC.text = @"CardsRemaining:";
            [_leftLabelC sizeToFit];
            _leftLabelC.y= _leftLabelB.y + _leftLabelB.height + 5.f;
            _leftLabelC.x = _leftLabelB.x;
            
            _rightLabelC.text = _gameFarmItem.cardsRemaining;
            [_rightLabelC sizeToFit];
            _rightLabelC.centerY = _leftLabelC.centerY;
            _rightLabelC.x = RIGHTLABELXMAX;
            
            _line.x = 15.f;
            _line.y = BOTEDITORITEMHIGHTSPEC - 1.f;
            _line.x = 30.f;
            break;
            
        default:
            break;
    }
}
@end
