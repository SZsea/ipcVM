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
#import "SECustomView.h"
#import "MAProgressHUD.h"
@interface SEMenuController()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong)BotListItem *listItem;

@property (nonatomic,strong)UIButton  *rightBtn;

@property (nonatomic,assign)BOOL     selectAll;

@property (nonatomic,strong)SECustomView  *customView;

@property (nonatomic,strong)SECustomView  *cdKeyView;

@property (nonatomic,strong)NSString    *extraStr;

@property (nonatomic,strong)NSString   *itemString;

@end

@implementation SEMenuController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:KNotificationEnSureAction object:nil];
}

- (void)setOperateKeyWord:(NSString *)operateKeyWord
{
    _operateKeyWord = [operateKeyWord copy]; 
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
- (NSString *)itemString
{
    if(!_itemString)
    {
        _itemString = [NSString new];
    }
    return _itemString;
}
- (SECustomView  *)cdKeyView
{
    if(!_cdKeyView)
    {
       _cdKeyView = [[SECustomView alloc] initWithstyle:SECustomViewCDKey];

    }
    return _cdKeyView;
}

- (SECustomView  *)customView
{
    if(!_customView)
    {
        if([_operateKeyWord isEqualToString:@"redeem^"])
        {
          _customView = [[SECustomView alloc] initWithstyle:SECustomViewRedeemT];
        }else if ([_operateKeyWord isEqualToString:@"redeem"])
        {
           _customView = [[SECustomView alloc] initWithstyle:SECustomViewRedeem];
        }else if([_operateKeyWord isEqualToString:@"addlicense"])
        {
          _customView = [[SECustomView alloc] initWithstyle:SECustomViewAddlicense];
        }else if([_operateKeyWord isEqualToString:@"start"])
        {
           _customView = [[SECustomView alloc] initWithstyle:SECustomViewStart];
        }else if([_operateKeyWord isEqualToString:@"stop"])
        {
           _customView = [[SECustomView alloc] initWithstyle:SECustomViewStop];
        }else if([_operateKeyWord isEqualToString:@"pause"]||[_operateKeyWord isEqualToString:@"pause~"])
        {
            _customView = [[SECustomView alloc] initWithstyle:SECustomViewPause];
        }else if([_operateKeyWord isEqualToString:@"pause&"])
        {
            
            self.itemString = nil;
            for(BotItem *item in _listItem.BotItemListArray)
            {
                if(item.isSelected)
                {
                    self.itemString = [self.itemString stringByAppendingString:[NSString stringWithFormat:@"%@,",item.name]];
                }
            }
            self.itemString = [self.itemString substringWithRange:NSMakeRange(0, self.itemString.length - 1)];
            _customView = [[SECustomView alloc] initWithstyle:SECustomViewPauseSconds withExtraString:self.itemString];
        }else if([_operateKeyWord isEqualToString:@"resume"])
        {
           _customView = [[SECustomView alloc] initWithstyle:SECustomViewResume];
        }else if([_operateKeyWord isEqualToString:@"2fa"])
        {
            _customView = [[SECustomView alloc] initWithstyle:SECustomView2fa];
        }else if([_operateKeyWord isEqualToString:@"2faok"])
        {
             _customView = [[SECustomView alloc] initWithstyle:SECustomView2faok];
        }



    }
    return _customView;
}

-(UIButton *)rightBtn
{
    if(!_rightBtn)
    {
        _rightBtn = [[UIButton alloc] init];
        [_rightBtn setTitle:@"全选" forState:UIControlStateNormal];
        [_rightBtn setTitleColor:MAColorWithStr(@"#347df7") forState:UIControlStateNormal];
        _rightBtn.size = CGSizeMake(64.f, 40.f);
        [_rightBtn addTarget:self action:@selector(rightBtnAct:) forControlEvents:UIControlEventTouchDown];
        _selectAll = NO;
    }
    return _rightBtn;
    
}
-(instancetype)init
{
    if(self = [super init])
    {
        self.view.backgroundColor = [UIColor  blackColor];
//        [self.navigationController setTitle:@"Bot列表"];
        [self.navigationItem setTitle:@"Bot列表"];
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightBtn];
        self.navigationItem.rightBarButtonItem = rightItem;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enSureAct) name:KNotificationEnSureAction object:nil];
        
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
//    BotItem *item =_listItem.BotItemListArray[indexPath.row];
//    SEItemManagerController *vc = [[SEItemManagerController alloc] initWith:item.name];
//    [self.navigationController pushViewController:vc animated:YES];
    MALog(@"111");
}

-(void)rightBtnAct:(UIButton *)btn
{
    if(!_selectAll)
    {
      [_rightBtn setTitle:@"取消" forState:UIControlStateNormal];
        _selectAll = !_selectAll;

        for(BotItem *item in _listItem.BotItemListArray)
        {
            item.isSelected =YES;
        }
    }else
    {
        [_rightBtn setTitle:@"全选" forState:UIControlStateNormal];
        _selectAll = !_selectAll;
      
        for(BotItem *item in _listItem.BotItemListArray)
        {
            item.isSelected = NO;
        }
    }
    [self.tableView reloadData];

    
}


-(void)enSureAct
{
    
    for(BotItem *item in _listItem.BotItemListArray)
    {
        if(item.isSelected)
        {
            self.itemString = [self.itemString stringByAppendingString:[NSString stringWithFormat:@"%@,",item.name]];
        }
    }
    if(self.itemString.length)
    {
      self.itemString = [self.itemString substringWithRange:NSMakeRange(0, self.itemString.length - 1)];
    }
    
    switch (self.customView.style) {
        case SECustomViewRedeem:
        {
           if(self.itemString.length)
           {
               [self.navigationController.view addSubview:self.customView];
               [self.customView showAnimation];
               WEAK_SELF;
               [self.customView setRightBtnblock:^(NSString *modes){
                   [MAProgressHUD show];
                   [(SEMenuDataProvider *)weakSelf.dataProvider redeemCDkeywithAccounts:weakSelf.itemString
                                                                               withkeys:modes
                                                                            WithSuccess:^(id  _Nonnull responseObject){
                                                                                ItemBase *item = [[ItemBase alloc] init];
                                                                                [item analyzeNetWorkData:responseObject];
                                                                                [MAProgressHUD showInfoWithTxt:item.result];
                                                                                [weakSelf.navigationController popViewControllerAnimated:YES];
                       
                   }
                                                                                failure:^(NSError * _Nonnull error){
                                                                                    
                                                                                    [MAProgressHUD showErrorWithTxt:error];
                                                                                    
                                                                                }];
                   
                   
               }];
               
           }else
           {
               
               [MAProgressHUD showErrorWithTxt:@"你还没有选择任何BOT"];
               
           }
        }
            break;
        case SECustomViewRedeemT:
        {
            [self.navigationController.view addSubview:self.customView];
            [self.customView showAnimation];
            WEAK_SELF;
            [self.customView setRightBtnblock:^(NSString *modes) {
                weakSelf.extraStr = modes;
                 [weakSelf.navigationController.view addSubview:weakSelf.cdKeyView];


                [weakSelf.cdKeyView showAnimation];
                [weakSelf.cdKeyView setRightBtnblock:^(NSString *modes) {
                    [MAProgressHUD show];
                    [(SEMenuDataProvider *)weakSelf.dataProvider redeemTCDkeywithAccounts:weakSelf.itemString
                                                                                 WithMode:weakSelf.extraStr
                                                                                 withkeys:modes
                                                                              WithSuccess:^(id  _Nonnull responseObject){
                                                                                  ItemBase *item = [[ItemBase alloc] init];
                                                                                  [item analyzeNetWorkData:responseObject];
                                                                                  [MAProgressHUD showInfoWithTxt:item.result];
                                                                                  [weakSelf.navigationController popViewControllerAnimated:YES];
                                                                                  
                                                                                  
                                                                              }
                                                                                  failure:^(NSError * _Nonnull error){
                                                                                      
                                                                                      [MAProgressHUD showErrorWithTxt:error];
                                                                                      
                                                                                  }];
                }];
            }];

            
        }
        case SECustomViewCDKey:
        {
            [self.navigationController.view addSubview:self.customView];
            [self.customView showAnimation];
        }
        case SECustomViewAddlicense:
        {
            [self.navigationController.view addSubview:self.customView];
            [self.customView showAnimation];
            WEAK_SELF;
            [self.customView setRightBtnblock:^(NSString *modes) {
                [MAProgressHUD show];
                [(SEMenuDataProvider *)weakSelf.dataProvider addlicensewithAccounts:weakSelf.itemString
                                                                        withGameIDs:modes
                                                                        WithSuccess:^(id  _Nonnull responseObject){
                                                                            ItemBase *item = [[ItemBase alloc] init];
                                                                            [item analyzeNetWorkData:responseObject];
                                                                            [MAProgressHUD showInfoWithTxt:item.result];
                                                                            [weakSelf.navigationController popViewControllerAnimated:YES];
                    
                }
                                                                            failure:^(NSError * _Nonnull error){
                                                                                 [MAProgressHUD showErrorWithTxt:error];
                    
                }];
                
            }];
            
        }
            break;
       case SECustomViewStart:
        {
            WEAK_SELF;
            [MAProgressHUD show];
            [(SEMenuDataProvider *)weakSelf.dataProvider startwithAccounts:self.itemString
                                                               WithSuccess:^(id  _Nonnull responseObject){
                                                                   ItemBase *item = [[ItemBase alloc] init];
                                                                   [item analyzeNetWorkData:responseObject];
                                                                   [MAProgressHUD showInfoWithTxt:item.result];
                                                                   [weakSelf.navigationController popViewControllerAnimated:YES];
                
            }
                                                                   failure:^(NSError * _Nonnull error){
                                                                       [MAProgressHUD showErrorWithTxt:error];
                
            }];
        }
            break;
        case SECustomViewStop:
        {
            WEAK_SELF;
            [MAProgressHUD show];
            [(SEMenuDataProvider *)weakSelf.dataProvider stopwithAccounts:self.itemString
                                                               WithSuccess:^(id  _Nonnull responseObject){
                                                                   ItemBase *item = [[ItemBase alloc] init];
                                                                   [item analyzeNetWorkData:responseObject];
                                                                   [MAProgressHUD showInfoWithTxt:item.result];
                                                                   [weakSelf.navigationController popViewControllerAnimated:YES];
                                                                   
                                                               }
                                                                   failure:^(NSError * _Nonnull error){
                                                                       [MAProgressHUD showErrorWithTxt:error];
                                                                       
                                                                   }];
            
            
        }
            break;
        case SECustomViewPause:
        {
            WEAK_SELF;
            [MAProgressHUD show];
            [(SEMenuDataProvider *)weakSelf.dataProvider pauseWithAccounts:self.itemString
                                                              WithSuccess:^(id  _Nonnull responseObject){
                                                                  ItemBase *item = [[ItemBase alloc] init];
                                                                  [item analyzeNetWorkData:responseObject];
                                                                  [MAProgressHUD showInfoWithTxt:item.result];
                                                                  [weakSelf.navigationController popViewControllerAnimated:YES];
                                                                  
                                                              }
                                                                  failure:^(NSError * _Nonnull error){
                                                                      [MAProgressHUD showErrorWithTxt:error];
                                                                      
                                                                  }];
        }
            break;
        case SECustomViewPauseSconds:
        {

            [self.navigationController.view addSubview:self.customView];
            self.itemString = nil;
            for(BotItem *item in _listItem.BotItemListArray)
            {
                if(item.isSelected)
                {
                    self.itemString = [self.itemString stringByAppendingString:[NSString stringWithFormat:@"%@,",item.name]];
                }
            }
            self.itemString = [self.itemString substringWithRange:NSMakeRange(0, self.itemString.length - 1)];
            [self.customView p_setextraStr:self.itemString];
            [self.customView showAnimation];
            WEAK_SELF;
            [self.customView setRightBtnblock:^(NSString *modes){
                [MAProgressHUD show];
                [(SEMenuDataProvider *)weakSelf.dataProvider pauseTWithAccounts:weakSelf.itemString
                                                                     WithSconds:modes
                                                                    WithSuccess:^(id  _Nonnull responseObject){
                                                                            ItemBase *item = [[ItemBase alloc] init];
                                                                            [item analyzeNetWorkData:responseObject];
                                                                            [MAProgressHUD showInfoWithTxt:item.result];
                                                                            [weakSelf.navigationController popViewControllerAnimated:YES];
                                                                            
                                                                        }
                                                                        failure:^(NSError * _Nonnull error){
                                                                                [MAProgressHUD showErrorWithTxt:error];
                                                                                
                                                                            }];
            }];
        }
            break;
        case SECustomViewResume:
        {
            WEAK_SELF;
            [MAProgressHUD show];
            [(SEMenuDataProvider *)weakSelf.dataProvider resumeWithAccounts:self.itemString
                                                                WithSuccess:^(id  _Nonnull responseObject){
                                                                   ItemBase *item = [[ItemBase alloc] init];
                                                                   [item analyzeNetWorkData:responseObject];
                                                                   [MAProgressHUD showInfoWithTxt:item.result];
                                                                   [weakSelf.navigationController popViewControllerAnimated:YES];
                                                                   
                                                               }
                                                                    failure:^(NSError * _Nonnull error){
                                                                       [MAProgressHUD showErrorWithTxt:error];
                                                                       
                                                                   }];
        }
            break;
        case SECustomView2fa:
        {
            WEAK_SELF;
            [MAProgressHUD show];
            [(SEMenuDataProvider *)weakSelf.dataProvider tfaWithAccounts:self.itemString
                                                                WithSuccess:^(id  _Nonnull responseObject){
                                                                    ItemBase *item = [[ItemBase alloc] init];
                                                                    [item analyzeNetWorkData:responseObject];
                                                                    [MAProgressHUD showInfoWithTxt:item.result];
                                                                    [weakSelf.navigationController popViewControllerAnimated:YES];
                                                                    
                                                                }
                                                                    failure:^(NSError * _Nonnull error){
                                                                        [MAProgressHUD showErrorWithTxt:error];
                                                                        
                                                                    }];
        }
            break;
        case SECustomView2faok:
        {
            WEAK_SELF;
            [MAProgressHUD show];
            [(SEMenuDataProvider *)weakSelf.dataProvider tfaokWithAccounts:self.itemString
                                                             WithSuccess:^(id  _Nonnull responseObject){
                                                                 ItemBase *item = [[ItemBase alloc] init];
                                                                 [item analyzeNetWorkData:responseObject];
                                                                 [MAProgressHUD showInfoWithTxt:item.result];
                                                                 [weakSelf.navigationController popViewControllerAnimated:YES];
                                                                 
                                                             }
                                                                 failure:^(NSError * _Nonnull error){
                                                                     [MAProgressHUD showErrorWithTxt:error];
                                                                     
                                                                 }];
        }
            break;
        default:
            break;
    }


            
            
    


    
    
    
}
@end
