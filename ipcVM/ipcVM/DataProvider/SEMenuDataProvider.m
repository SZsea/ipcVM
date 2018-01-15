//
//  SEMenuDataProvider.m
//  ipcVM
//
//  Created by Sean on 2018/1/2.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEMenuDataProvider.h"

@implementation SEMenuDataProvider
-(void)loadData
{
    [self loadBotsMenuWithSuccess:nil failure:nil];
}

-(void)loadBotsMenuWithSuccess:(void (^)())success failure:(void (^)())failure
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
        url = [NSString stringWithFormat:@"http://%@/Api/Command/status asf",self.account];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/status asf",self.account];
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

-(void)redeemTCDkeywithAccounts:(NSString *)accounts WithMode:(NSString *)modes withkeys:(NSString *)keys WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString new];
    if(!self.password.length)
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/redeem^",self.account];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/redeem^",self.account];
    }

    

    if(accounts.length)
    {
        url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",accounts]];
    }
    url = [url stringByAppendingString:[NSString stringWithFormat:@" %@ %@",modes,keys]];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];

    
    MALog(@"%@",url);
    WEAK_SELF;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleReceiveListData:)])
        {
//            [weakSelf.delegate handleReceiveListData:responseObject];
        }
        MALog(@"请求成功---%@",[responseObject class]);
        
        
        
        
    }  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        MALog(@"失败---%@",error);
        if(failure)
        {
            failure(error);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleFailureData:)])
        {
//            [weakSelf.delegate handleFailureData:nil];
        }
        
    }];
}

-(void)redeemCDkeywithAccounts:(NSString *)accounts withkeys:(NSString *)keys WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString new];
    if(!self.password.length)
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/redeem",self.account];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/redeem",self.account];
    }
    
    
    
    if(accounts.length)
    {
        url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",accounts]];
    }
    url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",keys]];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    
    
    MALog(@"%@",url);
    WEAK_SELF;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleReceiveListData:)])
        {
            //            [weakSelf.delegate handleReceiveListData:responseObject];
        }
        MALog(@"请求成功---%@",[responseObject class]);
        
        
        
        
    }  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        MALog(@"失败---%@",error);
        if(failure)
        {
            failure(error);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleFailureData:)])
        {
            //            [weakSelf.delegate handleFailureData:nil];
        }
        
    }];
}

-(void)addlicensewithAccounts:(NSString *)accounts withGameIDs:(NSString *)gameIDs WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString new];
    if(!self.password.length)
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/addlicense",self.account];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/addlicense",self.account];
    }
    
    
    
    if(accounts.length)
    {
        url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",accounts]];
    }
    url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",gameIDs]];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    
    
    MALog(@"%@",url);
    WEAK_SELF;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleReceiveListData:)])
        {
            //            [weakSelf.delegate handleReceiveListData:responseObject];
        }
        MALog(@"请求成功---%@",[responseObject class]);
        
        
        
        
    }  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        MALog(@"失败---%@",error);
        if(failure)
        {
            failure(error);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleFailureData:)])
        {
            //            [weakSelf.delegate handleFailureData:nil];
        }
        
    }];
}

-(void)startwithAccounts:(NSString *)accounts WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString new];
    if(!self.password.length)
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/start",self.account];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/start",self.account];
    }
    
    
    
    if(accounts.length)
    {
        url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",accounts]];
    }
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    
    
    MALog(@"%@",url);
    WEAK_SELF;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleReceiveListData:)])
        {
            //            [weakSelf.delegate handleReceiveListData:responseObject];
        }
        MALog(@"请求成功---%@",[responseObject class]);
        
        
        
        
    }  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        MALog(@"失败---%@",error);
        if(failure)
        {
            failure(error);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleFailureData:)])
        {
            //            [weakSelf.delegate handleFailureData:nil];
        }
        
    }];
}


-(void)stopwithAccounts:(NSString *)accounts WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString new];
    if(!self.password.length)
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/stop",self.account];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/stop",self.account];
    }
    
    
    
    if(accounts.length)
    {
        url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",accounts]];
    }
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    
    
    MALog(@"%@",url);
    WEAK_SELF;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleReceiveListData:)])
        {
            //            [weakSelf.delegate handleReceiveListData:responseObject];
        }
        MALog(@"请求成功---%@",[responseObject class]);
        
        
        
        
    }  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        MALog(@"失败---%@",error);
        if(failure)
        {
            failure(error);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleFailureData:)])
        {
            //            [weakSelf.delegate handleFailureData:nil];
        }
        
    }];
}

-(void)pauseWithAccounts:(NSString *)accounts WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString new];
    if(!self.password.length)
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/pause",self.account];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/pause",self.account];
    }
    
    
    
    if(accounts.length)
    {
        url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",accounts]];
    }
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    
    
    MALog(@"%@",url);
    WEAK_SELF;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleReceiveListData:)])
        {
            //            [weakSelf.delegate handleReceiveListData:responseObject];
        }
        MALog(@"请求成功---%@",[responseObject class]);
        
        
        
        
    }  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        MALog(@"失败---%@",error);
        if(failure)
        {
            failure(error);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleFailureData:)])
        {
            //            [weakSelf.delegate handleFailureData:nil];
        }
        
    }];
}


-(void)pauseFWithAccounts:(NSString *)accounts WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString new];
    if(!self.password.length)
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/pause~",self.account];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/pause~",self.account];
    }
    
    
    
    if(accounts.length)
    {
        url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",accounts]];
    }
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    
    
    MALog(@"%@",url);
    WEAK_SELF;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleReceiveListData:)])
        {
            //            [weakSelf.delegate handleReceiveListData:responseObject];
        }
        MALog(@"请求成功---%@",[responseObject class]);
        
        
        
        
    }  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        MALog(@"失败---%@",error);
        if(failure)
        {
            failure(error);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleFailureData:)])
        {
            //            [weakSelf.delegate handleFailureData:nil];
        }
        
    }];
}



-(void)pauseTWithAccounts:(NSString *)accounts WithSconds:(NSString *)sconds WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString new];
    if(!self.password.length)
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/pause&",self.account];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/pause&",self.account];
    }
    
    
    
    if(accounts.length)
    {
        url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",accounts]];
    }
    if(sconds.length)
    {
        url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",sconds]];
    }
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    
    
    MALog(@"%@",url);
    WEAK_SELF;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleReceiveListData:)])
        {
            //            [weakSelf.delegate handleReceiveListData:responseObject];
        }
        MALog(@"请求成功---%@",[responseObject class]);
        
        
        
        
    }  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        MALog(@"失败---%@",error);
        if(failure)
        {
            failure(error);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleFailureData:)])
        {
            //            [weakSelf.delegate handleFailureData:nil];
        }
        
    }];
}

-(void)resumeWithAccounts:(NSString *)accounts WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString new];
    if(!self.password.length)
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/resume",self.account];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/resume",self.account];
    }
    
    
    
    if(accounts.length)
    {
        url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",accounts]];
    }
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    
    
    MALog(@"%@",url);
    WEAK_SELF;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleReceiveListData:)])
        {
            //            [weakSelf.delegate handleReceiveListData:responseObject];
        }
        MALog(@"请求成功---%@",[responseObject class]);
        
        
        
        
    }  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        MALog(@"失败---%@",error);
        if(failure)
        {
            failure(error);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleFailureData:)])
        {
            //            [weakSelf.delegate handleFailureData:nil];
        }
        
    }];
}


-(void)tfaWithAccounts:(NSString *)accounts WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString new];
    if(!self.password.length)
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/2fa",self.account];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/2fa",self.account];
    }
    
    
    
    if(accounts.length)
    {
        url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",accounts]];
    }
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    
    
    MALog(@"%@",url);
    WEAK_SELF;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleReceiveListData:)])
        {
            //            [weakSelf.delegate handleReceiveListData:responseObject];
        }
        MALog(@"请求成功---%@",[responseObject class]);
        
        
        
        
    }  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        MALog(@"失败---%@",error);
        if(failure)
        {
            failure(error);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleFailureData:)])
        {
            //            [weakSelf.delegate handleFailureData:nil];
        }
        
    }];
}

-(void)tfaokWithAccounts:(NSString *)accounts WithSuccess:(void (^)(id  _Nonnull responseObject))success failure:(void (^)(NSError * _Nonnull error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString new];
    if(!self.password.length)
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/2faok",self.account];
    }else
    {
        url = [NSString stringWithFormat:@"http://%@/Api/Command/2faok",self.account];
    }
    
    
    
    if(accounts.length)
    {
        url = [url stringByAppendingString:[NSString stringWithFormat:@" %@",accounts]];
    }
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    
    
    MALog(@"%@",url);
    WEAK_SELF;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleReceiveListData:)])
        {
            //            [weakSelf.delegate handleReceiveListData:responseObject];
        }
        MALog(@"请求成功---%@",[responseObject class]);
        
        
        
        
    }  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        MALog(@"失败---%@",error);
        if(failure)
        {
            failure(error);
        }
        if([weakSelf.delegate respondsToSelector:@selector(handleFailureData:)])
        {
            //            [weakSelf.delegate handleFailureData:nil];
        }
        
    }];
}
@end
