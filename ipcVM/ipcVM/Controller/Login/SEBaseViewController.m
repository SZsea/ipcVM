//
//  SEBaseViewController.m
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "SEBaseViewController.h"
#import "SELoginController.h"
#import "SEOperationMenuController.h"
#import "DataProviderBase.h"

@interface SEBaseViewController ()<DataProviderBaseDelegate>



@end

@implementation SEBaseViewController
-(void)dealloc
{
     MALog(@"%@ ---dealloc---" , NSStringFromClass([self class]));
      
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataProvider.delegate = self;
    [self.dataProvider loadData];
    
}

-(void)switchController
{
    if([self isKindOfClass:[SELoginController class]])
    {
        SEOperationMenuController *login = [[SEOperationMenuController alloc] init];
        UINavigationController *root =  [[UINavigationController alloc] initWithRootViewController:login];
        [UIApplication sharedApplication].keyWindow.rootViewController = root;

  


    }else
    {
        SELoginController *login = [[SELoginController alloc] init];
        UINavigationController *root =  [[UINavigationController alloc] initWithRootViewController:login];
        [UIApplication sharedApplication].keyWindow.rootViewController = root;
    }
    
    
}
@end
