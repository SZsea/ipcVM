//
//  Session.h
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//


/*! 账号\地址  */
extern NSString *const account;



@interface Session : NSObject

#pragma mark 存数据库
@property (nonatomic, copy)NSString *account;//账号


@property (nonatomic, copy)NSString *passWord;//账号
SINGLETON_DECLARATION

/** 判断是否登录*/
- (BOOL)isLogin;


@end
