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


@end

@implementation SEBotConfigView

-(instancetype)initWithBot:(BotConfigItem *)item
{
    if(self = [super init])
    {
        if(item)
        {
            _item = item;
            [self buildUIWithItem];
        }else
        {
            [self buildUIWithNUll];
        }
    }
    return self;
}

-(void)buildUIWithItem
{
    
}
-(void)buildUIWithNUll
{
    
}
@end
