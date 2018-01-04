//
//  SEMenuTableViewCell.m
//  ipcVM
//
//  Created by Sean on 2018/1/3.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEMenuTableViewCell.h"
#import "BotItem.h"
@interface SEMenuTableViewCell()
@property(nonatomic,strong)UILabel  *nameLabel;

@property(nonatomic,strong)UILabel  *discLabel;

@property(nonatomic,strong)UIView *line;

@property(nonatomic,strong)UIButton *selectBtn;

@property(nonatomic,strong)UILabel   *selectLab;

@end
@implementation SEMenuTableViewCell
-(UIButton *)selectBtn
{
    if(!_selectBtn)
    {
        _selectBtn = [[UIButton alloc] init];
        _selectBtn.size = CGSizeMake(64.f, BOTITEMHIGHT);
//        [_selectBtn addSubview:self.selectLab];
        _selectBtn.x = SCREEN_WIDTH - 64.f;
        _selectBtn.centerY = BOTITEMHIGHT/2;
        [_selectBtn addTarget:self action:@selector(selectBtnAct:) forControlEvents:UIControlEventTouchDown];

        _selectBtn.layer.borderColor = MAColorWithStr(@"#B5B5B5").CGColor;
        _selectBtn.layer.borderWidth = 1.f;
//        _selectBtn.backgroundColor = MAColorWithStr(@"#B5B5B5");
    }
    return _selectBtn;
    
}
-(UILabel *)selectLab
{
    if(!_selectLab)
    {
        _selectLab = [[UILabel alloc] init];
        _selectLab.font = MANUIFontWithSize(15.f);
        _selectLab.textColor  = [UIColor blackColor];
        _selectLab.text = @"已选择";
        [_selectLab sizeToFit];
        _selectLab.centerX = _selectBtn.width/2;
        _selectLab.centerY = _selectBtn.height/2;
    }
    return _selectLab;
    
}
-(UILabel *)nameLabel
{
    if(!_nameLabel)
    {
        _nameLabel = [[UILabel alloc] init];

    }
    return _nameLabel;
}
-(UILabel *)discLabel
{
    if(!_discLabel)
    {
        _discLabel = [[UILabel alloc] init];

    }
    return _discLabel;
    
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpBuildUI];
//        self.backgroundColor = [UIColor redColor];
    }
    
    return self;
}

- (void)setUpBuildUI{
    
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.discLabel];
    [self.contentView addSubview:self.selectBtn];
    
     _line= [[UIView alloc] initWithFrame:CGRectMake(0, BOTITEMHIGHT -1.f, SCREEN_WIDTH, 0.5f)];
    _line.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:_line];
}

- (void)setItem:(BotItem  *)item{
    _item = item;
    
    [self setUpData];
    

}

- (void)setUpData
{
    switch (_item.style) {
        case BotItemStyleStates:
            _discLabel.text = _item.allStates;
//            [_discLabel sizeToFit];
            _discLabel.numberOfLines = 0;
            _discLabel.font = MANUIFontWithSize(15.f);
            _discLabel.lineBreakMode = NSLineBreakByWordWrapping;
            CGSize size = [_discLabel sizeThatFits:CGSizeMake(SCREEN_WIDTH - 16.f - 64.f, MAXFLOAT)];
            
            _discLabel.frame = CGRectMake(16.f, 0, SCREEN_WIDTH - 16.f, size.height);
  
            _discLabel.centerY = BOTITEMHIGHT/2;
            _discLabel.x = 16.f;
//
            _discLabel.textColor = [UIColor blackColor];
            [_selectBtn removeFromSuperview];
            break;
        case BotItemStyleNone:
            _nameLabel.text = _item.name;
            [_nameLabel sizeToFit];
            _nameLabel.centerY = BOTITEMHIGHT/2;
            _nameLabel.x = 16.f;
            _nameLabel.font = MABUIFontWithSize(15.f);
            _nameLabel.textColor = [UIColor blackColor];
            
            self.discLabel.text = _item.states;
//            [self.discLabel sizeToFit];
            _discLabel.numberOfLines = 0;
            _discLabel.font = MANUIFontWithSize(15.f);
            _discLabel.lineBreakMode = NSLineBreakByWordWrapping;
            CGSize sizee = [_discLabel sizeThatFits:CGSizeMake(SCREEN_WIDTH -  _nameLabel.x - 64.f - 64.f, MAXFLOAT)];
            
            _discLabel.frame = CGRectMake(_nameLabel.x + 64.f, 0, SCREEN_WIDTH - _nameLabel.x - 64.f, sizee.height);
            _discLabel.centerY = _nameLabel.centerY;
            _discLabel.lineBreakMode = NSLineBreakByWordWrapping;
            
            _discLabel.textColor = [UIColor blackColor];
            
            break;
        default:
            break;
    }
        
    
}

-(void)selectBtnAct:(UIButton *)button
{
    if(self.selectLab.superview)
    {
        [self.selectLab removeFromSuperview];
    }else
    {
        [button addSubview:self.selectLab];
    }
    
}
@end
