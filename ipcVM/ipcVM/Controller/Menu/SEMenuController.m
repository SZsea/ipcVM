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
#import "BotItem.h"
#import "SEMenuTableViewCell.h"
#import "SEItemManagerController.h"
@interface SEMenuController()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong)BotListItem *listItem;

@end

@implementation SEMenuController
- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navigationController.view.height, SCREEN_WIDTH, SCREEN_HEIGHT - self.navigationController.view.height)];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView dequeueReusableCellWithIdentifier:@"Menu"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
    }
    return _tableView;
}

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
    [self.view addSubview:self.tableView];
    self.dataProvider =  [[SEMenuDataProvider alloc] init];
    WS(blockSelf);
    [super viewDidLoad];

    _tableView.mj_header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        [blockSelf.dataProvider loadData];
    }];
    
    _tableView.mj_footer =  [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [blockSelf.dataProvider loadData];
    }];
    

}

- (void)handleReceiveListData:(id)item
{
    _listItem = [[BotListItem alloc] init];
    [_listItem analyzeNetWorkData:item];
//    [self.tableView reloadData];
    
    if (_tableView.mj_footer) {
        [_tableView.mj_footer setHidden:false];
    }
    
    
    if (_tableView) {
        [_tableView reloadData];
        [_tableView.mj_header endRefreshing];
        [_tableView.mj_footer endRefreshing];
    }
}

#pragma mark  UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return  BOTITEMHIGHT;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return _listItem.BotItemListArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SEMenuTableViewCell *cell  = [[SEMenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Menu"];
    BotItem *item =_listItem.BotItemListArray[indexPath.row];
    cell.item = item;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BotItem *item =_listItem.BotItemListArray[indexPath.row];
    SEItemManagerController *vc = [[SEItemManagerController alloc] initWith:item.name];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
