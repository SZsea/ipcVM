//
//  SEBotAddController.m
//  ipcVM
//
//  Created by Sean on 2018/2/22.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEBotAddController.h"
#import "SEBotEditorDataProvider.h"
#import "SEBotAddViewCell.h"
#import "BotDetailItem.h"
#import "BotConfigItem.h"

@interface SEBotAddController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView  *tableView;

@property (nonatomic,strong)NSDictionary *addBotJson;

@property (nonatomic,strong)BotDetailItem *botItem;

@end

@implementation SEBotAddController

-(instancetype)init
{
    if(self = [super init])
    {
        self.view.backgroundColor = [UIColor  blackColor];
        _botItem = [[BotDetailItem alloc] init];

    }
    return self;
}

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navigationController.view.height, SCREEN_WIDTH, SCREEN_HEIGHT - self.navigationController.view.height)];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView dequeueReusableCellWithIdentifier:@"BotAdd"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)viewDidLoad
{
    
    [self.view addSubview:self.tableView];
    self.dataProvider =  [[SEBotEditorDataProvider alloc] init];
    [super viewDidLoad];

}


#pragma mark  UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    return  BOTADDITEMHIGHT;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return  2;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SEBotAddViewCell *cell  = [[SEBotAddViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BotAdd" withbot:_botItem];
    switch (indexPath.row) {
        case 0:
            cell.style = SEBotAddViewCellBotName;
            break;
        case 1:
            cell.style = SEBotAddViewCellBotConfig;
            break;
            
        default:
            break;
    }
    return cell;
}
@end
