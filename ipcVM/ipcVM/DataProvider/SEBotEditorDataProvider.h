//
//  SEBotEditorDataProvider.h
//  ipcVM
//
//  Created by Sean on 2018/2/6.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "DataProviderBase.h"

@interface SEBotEditorDataProvider : DataProviderBase


-(void)loadDataWith:(NSString *)botName WithSuccess:(void (^)())success failure:(void (^)())failure;

@end
