//
//  SEBotEditorController.m
//  ipcVM
//
//  Created by Sean on 2018/2/5.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEBotEditorController.h"
#import "SEBotEditorDataProvider.h"

@interface SEBotEditorController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,copy)NSString        *botName;

@property (nonatomic,strong)UITableView  *tableView;
@end

@implementation SEBotEditorController


-(instancetype)initWithBotName:(NSString *)name{
    if(self = [super init])
    {
        _botName = [name copy];
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
//    _listItem = [[BotListItem alloc] init];
//    [_listItem analyzeNetWorkData:item];
//    //    [self.tableView reloadData];
    
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
    
    return  100.f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BotEditor"];

    return cell;
}
@end
