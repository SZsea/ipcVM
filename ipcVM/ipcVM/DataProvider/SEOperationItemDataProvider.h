//
//  SEOperationItemDataProvider.h
//  ipcVM
//
//  Created by Sean on 2018/1/17.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEMenuDataProvider.h"

@interface SEOperationItemDataProvider : SEMenuDataProvider

-(void)addBotWithBotbody:(NSDictionary *)botjson WithName:(NSString *)botName WithSuccess:(void (^)())success failure:(void (^)())failure;

@end
