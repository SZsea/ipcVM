//
//  SEDataProvider.h
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@protocol  DataProviderBaseDelegate<NSObject>

@optional
/**
 *  收到列表数据
 */
- (void)handleReceiveListData:(id)item;

/**
 *  没有更多数据
 */
- (void)handleReceiveNoMoreData:(id)item;

/**
 *  请求失败
 */
- (void)handleFailureData:(id)item;

/**
 *  请求错误数据
 */
- (void)handleErrorData:(id)item;

@end

@interface DataProviderBase: NSObject

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSString    *account;

@property (nonatomic, strong) NSString    *password;

@property (nonatomic, weak)id           <DataProviderBaseDelegate>delegate;

-(void)loadData;

@end
