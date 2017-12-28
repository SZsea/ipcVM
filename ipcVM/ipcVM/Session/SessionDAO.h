//
//  SessionDAO.h
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "DAOBase.h"

/** 用户信息*/
@class Session;

@interface SessionDAO : DAOBase


/**
 *  插入一条用户信息
 *
 *  @param session 用户信息模型
 *
 *  @return true 为插入成功
 */
- (BOOL)insertSession:(Session *)session;


/**
 *  查询数据库中的用户信息
 *
 *  @return 返回数据库中最后插入的那一条数据。
 */
- (Session *)querySession;


/**
 *  清除数据
 */
- (void)clearSessionComplete:(void (^)(bool result))complete;

@end
