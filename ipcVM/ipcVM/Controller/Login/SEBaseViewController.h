//
//  SEBaseViewController.h
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//



@class DataProviderBase;


@interface SEBaseViewController : UIViewController


@property (nonatomic,strong)DataProviderBase                 *dataProvider;


-(void)switchController;

@end
