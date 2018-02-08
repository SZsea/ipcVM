//
//  SEBotEditorController.m
//  ipcVM
//
//  Created by Sean on 2018/2/5.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEBotEditorController.h"
#import "SEBotEditorDataProvider.h"
#import "BotDetailItem.h"
#import "SEBotEditorViewCell.h"
#import "BotDetailItem.h"

@interface SEBotEditorController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,copy)NSString        *botName;

@property (nonatomic,strong)UITableView  *tableView;

@property(nonatomic,strong)BotDetailItem  *botDetail;

@property(nonatomic,strong)NSMutableArray  *botArray;
@end

@implementation SEBotEditorController


-(instancetype)initWithBotName:(NSString *)name{
    if(self = [super init])
    {
        _botName = [name copy];
        self.view.backgroundColor = [UIColor  blackColor];
    }
    return self;
}

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navigationController.view.height, SCREEN_WIDTH, SCREEN_HEIGHT - self.navigationController.view.height)];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView dequeueReusableCellWithIdentifier:@"BotEditor"];
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
    WS(blockSelf);
    [super viewDidLoad];
    [(SEBotEditorDataProvider *)self.dataProvider loadDataWith:self.botName WithSuccess:nil failure:nil];
    _tableView.mj_header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        [(SEBotEditorDataProvider *)blockSelf.dataProvider loadDataWith:blockSelf.botName WithSuccess:nil failure:nil];
    }];
    
    _tableView.mj_footer =  [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [(SEBotEditorDataProvider *)blockSelf.dataProvider loadDataWith:blockSelf.botName WithSuccess:nil failure:nil];
    }];
    
    
}


- (void)handleReceiveListData:(id)item
{
    _botDetail = [[BotDetailItem alloc] init];
    [_botDetail analyzeNetWorkData:item];
    
//    _listItem = [[BotListItem alloc] init];
//    [_listItem analyzeNetWorkData:item];
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
    
    return  BOTEDITORITEMHIGHT;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 4)
    {
        if(_botDetail.botConfigBOOL)
        {
           return 4;
        }
    }
    if(section == 5)
    {
        if(_botDetail.cardFarmerBOOL)
        {
            return 4;
        }
    }
    
    return  1;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 
    return 6;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SEBotEditorViewCell *cell  = [[SEBotEditorViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BotEditor"];
    cell.botDetailItem = _botDetail;
    switch (indexPath.section) {
        case 0:
            cell.style =  SEBotEditorViewCellBotName;
            break;
        case 1:
            cell.style = SEBotEditorViewCellSteamId;
            break;
        case 2:
            cell.style = SEBotEditorViewCellKeepRunning;
            break;
        default:
            break;
    }
    
    

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 4)
    {
        _botDetail.botConfigBOOL = !_botDetail.botConfigBOOL;
    }
    if(indexPath.section == 5)
    {
        _botDetail.cardFarmerBOOL = !_botDetail.cardFarmerBOOL;
    }
    [_tableView reloadData];
}

@end
