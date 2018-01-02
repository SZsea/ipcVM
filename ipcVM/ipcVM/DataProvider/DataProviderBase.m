//
//  SEDataProvider.m
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "DataProviderBase.h"
#import "Session.h"

@implementation DataProviderBase




#pragma mark get

- (NSMutableArray *)dataArray {
    if (nil == _dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

-(void)loadData
{

}

-(NSString *)account
{
    if(!_account.length)
    {
        _account = [Session sharedInstance].account;
    }
    return _account;
}

-(NSString *)password
{
    if(!_password.length)
    {
        _password = [Session sharedInstance].passWord;
    }
    return _password;
}
@end
