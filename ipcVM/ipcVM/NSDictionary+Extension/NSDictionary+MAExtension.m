//
//  NSDictionary+MAExtension.m
//  MicroAnswer
//
//  Created by joe on 16/12/13.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "NSDictionary+MAExtension.h"

@implementation NSDictionary (MAExtension)

@end

@implementation NSDictionary (PurifyObjectForKey)

- (id)purifyObjectForKey:(id)key
{
    id object = self[key];

    if (nil == object){
        MALog(@"%@对应的值不存在",key);
    }

    if ([object isKindOfClass:[NSNull class]]) {
        object = nil;
        MALog(@"%@键对应的值为<NSNull>类型",key);
    }
    
    return object;
}

- (NSString *)purifyStringForKey:(id)key
{
    id object = [self purifyObjectForKey:key];
    
    if (nil == object) {
        MALog(@"%@键对应的值不存在",key);
        object = @"";
    }
    else if ([object isKindOfClass:[NSNumber class]]) {
        object = [(NSNumber *)object description];
    }
    else if ([object isKindOfClass:[NSNull class]]) {
        object = @"";
        MALog(@"%@键对应的值为<NSNull>类型",key);
    }
    
    return object;
}

- (BOOL)isExitNullValue{
    
    BOOL result = NO;
    
    NSArray *keys = [self allKeys];
    
    for (NSString *key in keys) {
        id object = [self purifyObjectForKey:key];
        
        if (nil == object) {
            result = YES;
            break;
        }
    }
    
    
    return result;
    
}

@end

@implementation NSMutableDictionary (MASafe)

- (void)safeSetValue:(id)value forKey:(NSString *)key{
    if (value) {
        [self setValue:value forKey:key];
    }
}


@end
