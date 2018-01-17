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
#import "SEOperationItemController.h"


@interface SEOperationMenuController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *menuArray;

@property (nonatomic,strong)NSMutableArray *menuTitle;

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

-(NSMutableArray *)menuTitle
{
    if(!_menuTitle)
    {

         _menuTitle = [[NSMutableArray alloc] initWithObjects:@"命令 / Command",@"BOT编辑",nil];
    }
    return _menuTitle;
}


-(NSMutableArray *)menuArray
{
    if(!_menuArray)
    {
        _menuArray = [NSMutableArray new];
        NSArray *command1 = [[NSArray alloc] initWithObjects:@"redeem",@"redeem^",@"addlicense",@"start",@"stop",@"pause",@"pause~",@"pause&",@"resume",@"2fa",@"2faok", nil];
        NSArray *command2 = [[NSArray alloc] initWithObjects:@"BOT操作", nil];
        [_menuArray addObject:command1];
        [_menuArray addObject:command2];

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
    
    return  OPERATIONMENUHIGHT;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.menuArray[section];
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
    label.text  = self.menuTitle[section];
    label.font = MANUIFontWithSize(15.f);
    [label sizeToFit];
    label.textColor = [UIColor blackColor];
    
    
    return label;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            SEMenuController *vc = [[SEMenuController alloc] init];
            vc.operateKeyWord = self.menuArray[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            SEOperationItemController *vc = [[SEOperationItemController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
            
        default:
            break;
    }

    

}
@end
