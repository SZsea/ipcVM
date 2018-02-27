//
//  SEBotEditorDataProvider.m
//  ipcVM
//
//  Created by Sean on 2018/2/6.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEBotEditorDataProvider.h"

@implementation SEBotEditorDataProvider


-(void)loadDataWith:(NSString *)botName WithSuccess:(void (^)())success failure:(void (^)())failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //2.发送请求
    //    NSDictionary *param = @{
    //                            @"username":@"",
    //                            @"pwd":@""
    //                            };
    
    //注意：responseObject:请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组）
    NSString *url = [NSString new];
    if(!self.password.length)
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Bot/%@",self.account,botName];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Bot/%@",self.account,botName];
    }
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    MALog(@"%@",url);
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
        MALog(@"请求成功---%@",[responseObject class]);
        
        
        
        
    }  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        MALog(@"失败---%@",error);
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



-(void)deleteBotWithName:(NSString *)botName WithSuccess:(void (^)())success failure:(void (^)())failure
{
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //2.发送请求
    //    NSDictionary *param = @{
    //                            @"username":@"",
    //                            @"pwd":@""
    //                            };
    
    //注意：responseObject:请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组）
    
    //    NSData* json = [NSJSONSerialization dataWithJSONObject:botjson options:NSJSONWritingPrettyPrinted error:nil];
    NSString *url = [NSString new];
    if(!self.password.length)
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Bot/%@",self.account,botName];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Bot/%@",self.account,botName];
    }
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    MALog(@"%@",url);
    WEAK_SELF;
    [manager DELETE:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success)
        {
            success();
        }
        //            if([weakSelf.delegate respondsToSelector:@selector(handleReceiveListData:)])
        //            {
        //                [weakSelf.delegate handleReceiveListData:responseObject];
        //            }
        MALog(@"请求成功---%@",[responseObject class]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        MALog(@"失败---%@",error);
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
