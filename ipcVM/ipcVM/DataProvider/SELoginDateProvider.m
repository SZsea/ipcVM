//
//  SELoginDateProvider.m
//  ipcVM
//
//  Created by Sean on 2017/12/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "SELoginDateProvider.h"

@implementation SELoginDateProvider

-(void)loadData
{
    
}

-(void)getLoginCodeWithAccount:(NSString *)account password:(NSString *)password success:(void (^)())success failure:(void (^)())failure
{
    //1.创建AFHTTPSessionManager管理者
    //AFHTTPSessionManager内部是基于NSURLSession实现的
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //2.发送请求
//    NSDictionary *param = @{
//                            @"username":@"",
//                            @"pwd":@""
//                            };
    
    //注意：responseObject:请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组）
    NSString *url = [NSString new];
    if(!password.length)
    {
      url = [NSString stringWithFormat:@"http://%@/Api/Command/version",account];
    }else
    {
      url = [NSString stringWithFormat:@"http://%@/Api/Command/version",account];
    }
   
    WEAK_SELF;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if(success)
        {
            success();
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleReceiveListData:)])
        {
            [weakSelf.delegate handleReceiveListData:responseObject];
        }
        NSLog(@"请求成功---%@",[responseObject class]);
        
        
        
        
    }  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"失败---%@",error);
        if(failure)
        {
            failure();
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleFailureData:)])
        {
            [weakSelf.delegate handleFailureData:nil];
        }
        
    }];
    
    
}
@end
