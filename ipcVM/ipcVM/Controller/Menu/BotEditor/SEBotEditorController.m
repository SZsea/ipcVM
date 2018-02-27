//
//  SEBotEditorController.m
//  ipcVM
//
//  Created by Sean on 2018/2/5.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEBotEditorController.h"
#import "SEBotEditorDataProvider.h"
#import "SEBotEditorViewCell.h"
#import "BotDetailItem.h"
#import "CardFarmerItem.h"
#import "GameFarmItem.h"
#import "SECustomView.h"
@interface SEBotEditorController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,copy)NSString        *botName;

@property (nonatomic,strong)UITableView  *tableView;

@property(nonatomic,strong)BotDetailItem  *botDetail;

@property(nonatomic,strong)NSMutableArray  *botArray;

@property(nonatomic,strong)SECustomView    *customView;
@end

@implementation SEBotEditorController
- (SECustomView  *)customView
{
    if(!_customView)
    {
        WEAK_SELF;
        _customView = [[SECustomView alloc] initWithExtraString:[NSString stringWithFormat:@"你确认要删除%@吗？",_botDetail.botName] cancelButton:^{
            
        } sureButton:^{
            [(SEBotEditorDataProvider *)weakSelf.dataProvider deleteBotWithName:weakSelf.botDetail.botName WithSuccess:^{
                
                [weakSelf.navigationController popViewControllerAnimated:YES];
            } failure:^{
                
            }];
        }];

        
        
        
    }
    return _customView;
}

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
    if(indexPath.section == 5)
    {
        if((indexPath.row > 3 && indexPath.row < 4 + _botDetail.cardFarmerItem.currentGamesFarming.count) || (indexPath.row > 4 + _botDetail.cardFarmerItem.currentGamesFarming.count))
        {
            return BOTEDITORITEMHIGHTSPEC;
        }
    }

    return  BOTEDITORITEMHIGHT;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 4)
    {
        if(_botDetail.botConfigBOOL)
        {
           return 1;
        }
    }
    if(section == 5)
    {
        if(_botDetail.cardFarmerBOOL)
        {
            return 5 + _botDetail.cardFarmerItem.currentGamesFarming.count + _botDetail.cardFarmerItem.gameToFarm.count ;
        }
    }
    
    return  1;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 
    return 7;
    
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
        case 3:
            cell.style = SEBotEditorViewCellAccoutFlags;
            break;
        case 4:
        {
            switch (indexPath.row) {
                case 0:
                    cell.style = SEBotEditorViewCellBotConfig;
                    break;

                    
                default:
                    break;
            }
        }
            
            break;
        case 5:
        {
            switch (indexPath.row) {
                case 0:
                    cell.style = SEBotEditorViewCellCardFarmer;
                    break;
                case 1:
                    cell.style = SEBotEditorViewCellCardFarmerPaused;
                    break;
                case 2:
                    cell.style = SEBotEditorViewCellCardFarmerTimeRemaining;
                    break;
                case 3:
                    cell.style = SEBotEditorViewCellCardFarmerGameToFarm;
                    break;
                    
                default:
                    if(indexPath.row > 3 &&indexPath.row < 4 + _botDetail.cardFarmerItem.gameToFarm.count)
                    {
                        if(_botDetail.cardFarmerItem.gameToFarm.count)
                        {
                            
                            GameFarmItem *item = _botDetail.cardFarmerItem.gameToFarm[ indexPath.row - 4];
                            cell.gameFarmItem = item;
                            cell.style = SEBotEditorViewCellCardFarmerGameToFarmItem;
                        }

                    }
                    if(indexPath.row == 4 + _botDetail.cardFarmerItem.gameToFarm.count)
                    {
                        cell.style = SEBotEditorViewCellCardFarmercurrentGamesFarming;
                    }
                    if(indexPath.row > 4 + _botDetail.cardFarmerItem.gameToFarm.count)
                    {
                        if(_botDetail.cardFarmerItem.currentGamesFarming.count)
                        {

                            GameFarmItem *item = _botDetail.cardFarmerItem.currentGamesFarming[indexPath.row - 5 - _botDetail.cardFarmerItem.gameToFarm.count];
                            cell.gameFarmItem = item;
                            cell.style = SEBotEditorViewCellCardFarmercurrentGamesFarmingItem;

                        }

                    }
                    break;
            }
        }
            
            
            break;
        case 6:
            cell.style = SEBotEditorViewCellDeleteBot;
            break;
        default:
            break;
    }
    
    

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 4 && indexPath.row == 0)
    {
        _botDetail.botConfigBOOL = !_botDetail.botConfigBOOL;
        [_tableView reloadData];
    }
    if(indexPath.section == 5 && indexPath.row == 0)
    {
        _botDetail.cardFarmerBOOL = !_botDetail.cardFarmerBOOL;
        [_tableView reloadData];
    }
    if(indexPath.section == 6)
    {
        [self.navigationController.view addSubview:self.customView];
        [_customView showAnimation];
    }
}

@end
