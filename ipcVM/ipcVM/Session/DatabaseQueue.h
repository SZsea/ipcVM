//
//  DatabaseQueue.h
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

@class FMDatabaseQueue;

@interface DatabaseQueue : NSObject

@property (nonatomic, strong) FMDatabaseQueue *queue;

SINGLETON_DECLARATION

@end
