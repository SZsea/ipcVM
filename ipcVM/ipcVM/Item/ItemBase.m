//
//  ItemBase.m
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "ItemBase.h"
#import "NSDictionary+MAExtension.h"
@implementation ItemBase
- (void)dealloc{
    MALog(@"%@ ---- dealloc ---",[self description]);
    RELEASE_OBJECT(_message);
    RELEASE_OBJECT(_result);
    RELEASE_OBJECT(_success);
    
}


- (void)analyzeNetWorkData:(id)data{
    
    if (!data) return;
    
    
    if (MA_IsKindOfNSDictionaryClass(data)) {
        
        self.message = [data purifyStringForKey:@"Message"];
        
        self.result = [data purifyObjectForKey:@"Result"];
        
        self.success = [data purifyStringForKey:@"Success"];
        
        for(NSString *key in data){
            MALog(@"key = %@,value = %@",key,[data objectForKey:key]);
        }

        
    } else{
        return;
    }
    
    
}
@end
