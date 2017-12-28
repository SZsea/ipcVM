//
//  SEDataProvider.m
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "DataProviderBase.h"

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
@end
