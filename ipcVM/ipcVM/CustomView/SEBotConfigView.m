//
//  SEBotConfigView.m
//  ipcVM
//
//  Created by Sean on 2018/2/22.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEBotConfigView.h"
#import "BotConfigItem.h"
@interface SEBotConfigView()

@property(nonatomic,strong)BotConfigItem *item;

@property(nonatomic,strong)NSMutableArray *configArrayText;

@property(nonatomic,strong)NSMutableArray *configArrayLabel;
@end

@implementation SEBotConfigView

-(instancetype)initWithBot:(BotConfigItem *)item
{
    if(self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 800.f)])
    {
//        self.backgroundColor = [UIColor redColor];
        _item = item;
        _configArrayText = [NSMutableArray arrayWithObjects:@"AcceptGifts",@"AutoSteamSaleEvent",@"CustomGamePlayedWhileFarming", nil];
        _configArrayLabel = [NSMutableArray new];
        [self buildUI];

    }
    return self;
}

-(void)buildUI
{
    for(int i = 0;i < _configArrayText.count;i ++)
    {
        UILabel *label = [[UILabel alloc] init];
        label.text = _configArrayText[i];
        label.font = [UIFont systemFontOfSize:15.f];
        label.textColor = [UIColor blackColor];
        [label sizeToFit];
        label.x = 5.f;
        label.y = 30.f * i;
        [self addSubview:label];
        [_configArrayLabel addObject:label];
        
    }
}

@end
