//
//  SEMenuDataProvider.h
//  ipcVM
//
//  Created by Sean on 2018/1/2.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "DataProviderBase.h"

@interface SEMenuDataProvider : DataProviderBase


-(void)redeemCDkeywith:(NSString *)accounts WithSuccess:(void (^)())success failure:(void (^)())failure;
@end
