//
//  SEItemManagerController.m
//  ipcVM
//
//  Created by Sean on 2018/1/3.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEItemManagerController.h"
#import "SEItemMangerDataProvider.h"
@interface SEItemManagerController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,copy)NSString  *botName;

@property (nonatomic,strong) UITableView *tableView;
@end

@implementation SEItemManagerController

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

-(instancetype)initWith:(NSString *)botName
{
    if(self = [super init])
    {
        _botName = [botName copy];
    }
    
    return self;
}
- (void)viewDidLoad
{
    [self.view addSubview:self.tableView];
    self.dataProvider =  [[SEItemMangerDataProvider alloc] init];
    WS(blockSelf);
    [super viewDidLoad];
    
    _tableView.mj_header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        [blockSelf.dataProvider loadData];
    }];
    
    _tableView.mj_footer =  [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [blockSelf.dataProvider loadData];
    }];
    
    
}
@end
