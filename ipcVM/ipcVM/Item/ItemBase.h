//
//  ItemBase.h
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemBase : NSObject

@property (nonatomic,copy) NSString  *message;

@property (nonatomic,strong) id  result;

@property (nonatomic,copy) NSString  *success;




- (void)analyzeNetWorkData:(id)data;
@end
