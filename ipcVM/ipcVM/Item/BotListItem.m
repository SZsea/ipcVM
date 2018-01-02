//
//  BotListItem.m
//  ipcVM
//
//  Created by Sean on 2018/1/2.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "BotListItem.h"
#import "BotItem.h"
@implementation BotListItem

- (void)analyzeNetWorkData:(id)data{
    [super analyzeNetWorkData:data];
    [self searchItem:self.result];
}




-(void)searchItem:(NSString *)data
{
    NSString *a = @"3333\n3333\n";
    NSArray *resultArr = [data componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    MALog(@"%@", resultArr);
    for(int i =0;i < resultArr.count;i ++)
    {
        
    }
    

    
    
    
}

@end
