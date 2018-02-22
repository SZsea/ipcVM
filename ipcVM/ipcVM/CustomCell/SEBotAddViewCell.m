//
//  SEBotAddViewCell.m
//  ipcVM
//
//  Created by Sean on 2018/2/22.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEBotAddViewCell.h"
@interface SEBotAddViewCell()

@property(nonatomic,strong)UIView *line;

@end
@implementation SEBotAddViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
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

    
}
@end
