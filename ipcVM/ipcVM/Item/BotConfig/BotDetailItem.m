//
//  BotDetailItem.m
//  ipcVM
//
//  Created by Sean on 2018/2/6.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "BotDetailItem.h"
#import "BotConfigItem.h"
#import "CardFarmerItem.h"

@implementation BotDetailItem

- (void)analyzeNetWorkData:(id)data{
    [super analyzeNetWorkData:data];
    [self searchItem:self.result];
}

-(void)searchItem:(NSString *)data
{
    
    NSArray *resultArr = [data componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    //    MALog(@"%@", resultArr);

    
    
    
    
}
@end
