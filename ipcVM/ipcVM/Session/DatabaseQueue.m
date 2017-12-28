//
//  DatabaseQueue.m
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "DatabaseQueue.h"
#import "FMDB.h"

#define SEMINE_DB  @"/SEMINE.db"

#define DATABASE_DIRECTORY_NAME @"/Database"

@interface DatabaseQueue()

- (void)createDatabase;

@end

@implementation DatabaseQueue

- (void)dealloc
{
    RELEASE_OBJECT(_queue);
}

- (instancetype)init
{
    if (self = [super init]) {
        [self createDatabase];
    }
    return self;
}


- (void)createDatabase
{
    NSString *documentFilePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).lastObject;
    
    NSString *databaseDirectoryPath = [documentFilePath stringByAppendingPathComponent:DATABASE_DIRECTORY_NAME];
    
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:databaseDirectoryPath]) { // 文件不存在，创建文件
        [[NSFileManager defaultManager] createDirectoryAtPath:databaseDirectoryPath withIntermediateDirectories:false attributes:nil error:nil];
    }
    NSString *filePath = [databaseDirectoryPath stringByAppendingPathComponent:SEMINE_DB];
    
    [self createDatabaseQueueWithFilePath:filePath];
}

- (void)createDatabaseQueueWithFilePath:(NSString *)filePath
{
    self.queue = [FMDatabaseQueue databaseQueueWithPath:filePath];
}

#pragma mark 单列

SINGLETON_IMPLEMENT_FOR_CLASS([self class])



@end
