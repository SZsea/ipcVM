//
//  SEOperationItemController.m
//  ipcVM
//
//  Created by Sean on 2018/1/17.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEOperationItemController.h"
#import "SEOperationItemCell.h"
#import "BotListItem.h"
#import "SEOperationItemDataProvider.h"
#import "BotItem.h"
#import "SEBotEditorController.h"
#import "SEBotAddController.h"
#import "BotConfigItem.h"
@interface SEOperationItemController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong)BotListItem *listItem;

@end

@implementation SEOperationItemController

-(instancetype)init
{
    if(self = [super init])
    {
        self.view.backgroundColor = [UIColor  blackColor];
        //        [self.navigationController setTitle:@"Bot列表"];
        [self.navigationItem setTitle:@"Bot列表"];
//        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightBtn];
//        self.navigationItem.rightBarButtonItem = rightItem;
        
    }
    return self;
}

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

- (void)viewDidLoad
{
    
    [self.view addSubview:self.tableView];
    self.dataProvider =  [[SEOperationItemDataProvider alloc] init];
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
    
    return  OPERATIONITEMHIGHT;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _listItem.BotItemListArray.count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SEOperationItemCell *cell  = [[SEOperationItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OperationItem"];
    BotItem *item =_listItem.BotItemListArray[indexPath.row];
    cell.item = item;

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BotItem *item =_listItem.BotItemListArray[indexPath.row];
    if(item.name.length)
    {
        SEBotEditorController *vc = [[SEBotEditorController alloc] initWithBotName:item.name];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if(indexPath.row == _listItem.BotItemListArray.count - 1)
    {
//        MALog(@"231231");
//        SEBotAddController *vc = [[SEBotAddController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
        NSMutableDictionary  *dic = [NSMutableDictionary new];
        int i;
        int propertyCount = 0;
        objc_property_t *properties = class_copyPropertyList([BotConfigItem class], &propertyCount);
        
        for ( i=0; i < propertyCount; i++ ) {
            objc_property_t property = properties[i];
            
            const char* char_f =property_getName(property);
            
            NSString *propertyName = [NSString stringWithUTF8String:char_f];
            if([propertyName isEqualToString:@"AcceptGifts"])
            {
                
            }
            [dic setObject:@"false" forKey:propertyName];
            
        }
        NSMutableDictionary  *dicD = [NSMutableDictionary new];
        [dicD setObject:dic forKey:@"BotConfig"];
        [dicD setObject:@"true" forKey:@"KeepSensitiveDetails"];
        [(SEOperationItemDataProvider *)self.dataProvider addBotWithBotbody:dicD WithName:@"archi" WithSuccess:nil failure:nil];
    }

    
}


    
    
    

@end
