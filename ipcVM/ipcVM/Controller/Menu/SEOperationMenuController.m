//
//  SEOperationMenuController.m
//  ipcVM
//
//  Created by Sean on 2018/1/4.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEOperationMenuController.h"
#import "SEOperationTableViewCell.h"
#import "SEMenuController.h"
@interface SEOperationMenuController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *menuArray;

@end

@implementation SEOperationMenuController

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navigationController.view.height, SCREEN_WIDTH, SCREEN_HEIGHT - self.navigationController.view.height) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView dequeueReusableCellWithIdentifier:@"Operation"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    }
    return _tableView;
}
-(NSMutableArray *)menuArray
{
    if(!_menuArray)
    {
        _menuArray = [NSMutableArray new];
        NSArray *command = [[NSArray alloc] initWithObjects:@"redeem",@"redeem^",@"addlicense",@"start",@"stop",@"pause",@"pause~",@"pause&",@"resume",@"2fa",@"2faok", nil];
        [_menuArray addObject:command];

    }
    return _menuArray;
}


-(instancetype)init
{
    if(self = [super init])
    {
        self.view.backgroundColor = [UIColor  blackColor];
        [self.navigationItem setTitle:@"操作列表"];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [self.view addSubview:self.tableView];

//    [super viewDidLoad];

    
    
}

#pragma mark  UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return  OPERATIONITEMHIGHT;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.menuArray[0];
    return array.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.menuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SEOperationTableViewCell *cell  = [[SEOperationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Operation"];
    
    cell.menu = self.menuArray[indexPath.section][indexPath.row];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 40.f;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    UILabel *label = [[UILabel alloc]  init];
    label.text  = @"命令 / Command";
    label.font = MANUIFontWithSize(15.f);
    [label sizeToFit];
    label.textColor = [UIColor blackColor];
    
    
    return label;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SEMenuController *vc = [[SEMenuController alloc] init];
    vc.operateKeyWord = self.menuArray[indexPath.section][indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    

}
@end
