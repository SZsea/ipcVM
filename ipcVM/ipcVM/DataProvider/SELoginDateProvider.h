//
//  SELoginDateProvider.h
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "DataProviderBase.h"

@interface SELoginDateProvider : DataProviderBase

-(void)loadData;


-(void)getLoginCodeWithAccount:(NSString *)account password:(NSString *)password;
@end
