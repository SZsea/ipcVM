//
//  SEMenuController.m
//  ipcVM
//
//  Created by Sean on 2017/12/29.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "SEMenuController.h"
#import "SessionDAO.h"
#import "Session.h"
@interface SEMenuController()

@property (nonatomic,strong) UITableView *tableView;
@end

@implementation SEMenuController


-(instancetype)init
{
    if(self = [super init])
    {
        self.view.backgroundColor = [UIColor  blackColor];

//        [self.view addSubview:self.accountLabel];
//        [self.view addSubview:self.accountText];
//
//        [self.view addSubview:self.passwordLabel];
//        [self.view addSubview:self.passwordText];
//
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesturedAction:)];
//        [self.view addGestureRecognizer:tap];
//        tap.delegate = self;
//        [self.view addSubview:self.confirmBtn];
        
        
        
    }
    return self;
}
@end
