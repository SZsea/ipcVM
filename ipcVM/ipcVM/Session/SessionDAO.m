//
//  SessionDAO.m
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "SessionDAO.h"
#import "DatabaseQueue.h"
#import "FMDB.h"
#import "Session.h"
// 创建 t_Session 表
#define CREATE_SESSION_TABLE_SQL @"CREATE TABLE IF NOT EXISTS t_Session(rowId integer primary key autoincrement,\
uid text unique,\
sid text,\
shareImages blob,\
basicInfo blob,\
schoolInfo blob,\
friendInfo blob,\
privacyInfo blob,\
foot blob,\
avatar text,\
isNew text\
);" // rowId 键值，uid 用户id 唯一的， sid 回话id

#define CREATE_UID_INDEX_SQL @"CREATE UNIQUE INDEX uid_index ON t_Session (uid)" // 创建一条数据，如果唯一的uid在 Session 表中不存在的时候

#define REPLACE_SQL @"REPLACE INTO t_Session(uid,sid,shareImages,basicInfo,schoolInfo,friendInfo,privacyInfo,foot,avatar,isNew) values(?, ?, ?, ?,?, ?,?,?,?,?);" // 代理数据库中的唯一数据

#define QUERY_SQL @"SELECT * FROM t_Session limit 1;"

#define CLEAR_SQL @"DELETE FROM t_Session"

@implementation SessionDAO

- (void)ifNotExistsCreateTabele
{
    [self ifNotExistCreateTableWithSqls:@[CREATE_SESSION_TABLE_SQL, CREATE_UID_INDEX_SQL]];
}

- (BOOL)insertSession:(Session *)session
{
    __block BOOL result = false;
    [[[DatabaseQueue sharedInstance] queue] inDatabase:^(FMDatabase *db) {
        
        //        NSData *psLabels = [NSKeyedArchiver archivedDataWithRootObject:session.psLabels];
        
        result = [db executeUpdate:REPLACE_SQL, session.account,session.passWord];
        
        
        if (result) {
            MALog(@" 成功插入一条数据");
        }
        
    }];
    
    return result;
}


- (Session *)querySession {
    Session *session = [Session sharedInstance];
    [[[DatabaseQueue sharedInstance] queue] inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQueryWithFormat:QUERY_SQL];
        while ([resultSet next]) {
            [session setValue:[resultSet stringForColumn:@"account"] forKey:@"account"];
            [session setValue:[resultSet stringForColumn:@"passWord"] forKey:@"passWord"];

            
            //            [self p_setSessionValueForKey:@"psLabels" resultSet:resultSet];
            
        }
    }];
    
    
    MALog(@"成功查询到一条数据");
    return session;
}


- (void)clearSessionComplete:(void (^)(bool result))complete
{
    [[[DatabaseQueue sharedInstance] queue] inDatabase:^(FMDatabase *db) {
        bool result =  [db executeUpdate:CLEAR_SQL];
        //        result == true ?  MALog(@"%s: 成功删除数据库", __FUNCTION__) : nil;
        if (complete) {
            complete(result);
        }
    }];
}

#pragma mark private

- (void)p_setSessionValueForKey:(NSString *)key resultSet:(FMResultSet *)resultSet{
    Session *session = [Session sharedInstance];
    NSData *json = [resultSet objectForColumnName:key];
    id info = [NSKeyedUnarchiver unarchiveObjectWithData:json];
    if (info) {
        [session setValue:info forKey:key];
    }
}


@end
