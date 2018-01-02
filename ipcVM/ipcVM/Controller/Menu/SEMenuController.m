//
//  SEMenuController.m
//  ipcVM
//
//  Created by Sean on 2017/12/29.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "SEMenuController.h"
#import "SEMenuDataProvider.h"
#import "BotListItem.h"
@interface SEMenuController()

@property (nonatomic,strong) UITableView *tableView;
@end

@implementation SEMenuController


-(instancetype)init
{
    if(self = [super init])
    {
        self.view.backgroundColor = [UIColor  blackColor];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    self.dataProvider =  [[SEMenuDataProvider alloc] init];
    [super viewDidLoad];
    
}

- (void)handleReceiveListData:(id)item
{
    BotListItem *listItem = [[BotListItem alloc] init];
    [listItem analyzeNetWorkData:item];
}
@end
