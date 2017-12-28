//
//  DAOBase.m
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "DAOBase.h"
#import "FMDB.h"
#import "DatabaseQueue.h"

@implementation DAOBase

- (instancetype)init
{
    if (self = [super init]) {
        [self ifNotExistsCreateTabele];
    }
    return self;
}


- (void)ifNotExistsCreateTabele
{
    
}

- (void)ifNotExistCreateTableWithSqls:(NSArray *)sqls
{
    // 利用这个方法是线程安全的，因为DatabaseQueue 是个单例，如果在各个线程里面使用数据库，会发生资源抢夺问题。
    [[[DatabaseQueue sharedInstance] queue] inDatabase:^(FMDatabase *db) {
        // 标记着数据库开始执行语句，防止其他线程进入数据库读取和写入数据
        [db beginTransaction];
        
        for (NSString *sql in sqls) { // 执行每一条数据库语句
            
            [db executeUpdate:sql];
        }
        
        // 数据库语句执行完毕
        [db commit];
    }];
}


@end
