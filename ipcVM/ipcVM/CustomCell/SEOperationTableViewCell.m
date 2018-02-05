//
//  SEOperationTableViewCell.m
//  ipcVM
//
//  Created by Sean on 2018/1/4.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEOperationTableViewCell.h"
@interface SEOperationTableViewCell()

@property(nonatomic,strong)UIView *line;

@property(nonatomic,strong)UILabel *label;

@end
@implementation SEOperationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpBuildUI];
//                self.backgroundColor = [UIColor redColor];
    }
    
    return self;
}

- (UILabel *)label
{
    if(!_label)
    {
        _label = [[UILabel alloc] init];
        _label.textColor = [UIColor blackColor];
        _label.font = MANUIFontWithSize(15.f);
        
    }
    return _label;
}

-(void)setMenu:(NSString *)menu
{
    _label.text = menu;
    [_label sizeToFit];
    _label.centerY = OPERATIONMENUHIGHT/2;
    _label.centerX = SCREEN_WIDTH/2;
    
    
}
- (void)setUpBuildUI
{
    _line= [[UIView alloc] initWithFrame:CGRectMake(0, OPERATIONMENUHIGHT -1.f, SCREEN_WIDTH, 0.5f)];
    _line.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:_line];
    [self.contentView addSubview:self.label];
    self.backgroundColor  = MAColorWithStr(@"#FFFFE0");

    
}
@end
