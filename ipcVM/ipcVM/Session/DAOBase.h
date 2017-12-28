//
//  DAOBase.h
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

@interface DAOBase : NSObject

/**
 *  执行SQL语句，可多句执行
 *
 *  @param sqls 数据库语句数组
 */
- (void)ifNotExistCreateTableWithSqls:(NSArray *)sqls;



/**
 *  创建表格(子类实现)
 */
- (void)ifNotExistsCreateTabele;


@end
