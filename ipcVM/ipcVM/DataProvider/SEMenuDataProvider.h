//
//  SEMenuDataProvider.h
//  ipcVM
//
//  Created by Sean on 2018/1/2.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "DataProviderBase.h"

@interface SEMenuDataProvider : DataProviderBase


-(void)redeemTCDkeywithAccounts:(NSString *)accounts WithMode:(NSString *)modes withkeys:(NSString *)keys WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure;



-(void)redeemCDkeywithAccounts:(NSString *)accounts withkeys:(NSString *)keys WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure;



-(void)addlicensewithAccounts:(NSString *)accounts withGameIDs:(NSString *)gameIDs WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure;
@end
