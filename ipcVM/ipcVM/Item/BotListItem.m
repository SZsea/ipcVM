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
    
    NSArray *resultArr = [data componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
//    MALog(@"%@", resultArr);
    for(int i =0;i < resultArr.count;i ++)
    {
        NSString *string = resultArr[i];
        if(string.length)
        {
            if([string rangeOfString:@">"].location == NSNotFound && [string rangeOfString:@"<"].location == NSNotFound )
            {
                BotItem *item = [[BotItem alloc] initWithallStates:string];
                [self.BotItemListArray addObject:item];

            }else
            {
                NSUInteger location = [string rangeOfString:@"<"].location +1;
                NSUInteger length = [string rangeOfString:@">"].location - location;
                NSRange range = NSMakeRange(location, length);
                
                NSRange range2 = NSMakeRange(length + location + 1, string.length - (length + location + 1));
                NSString *newStr = [string  substringWithRange:range];//返回一个新的字符串
                
                NSString *newStr2 = [string  substringWithRange:range2];
//                NSLog(@"newStr = %@",newStr);
//                NSLog(@"newStr2 = %@",newStr2);
                BotItem *item = [[BotItem alloc] initWithName:newStr withStates:newStr2];
                [self.BotItemListArray addObject:item];
            }

        }
    }
    BotItem *item = [[BotItem alloc] initWithallStates:@""];
    [self.BotItemListArray addObject:item];

    
    
    
}
-(NSMutableArray *)BotItemListArray
{
   if(!_BotItemListArray)
   {
       _BotItemListArray = [NSMutableArray new];
   }
    return _BotItemListArray;
    
}
@end
