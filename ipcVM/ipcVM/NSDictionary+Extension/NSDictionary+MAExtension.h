//
//  NSDictionary+MAExtension.h
//  MicroAnswer
//
//  Created by joe on 16/12/13.
//  Copyright © 2016年 joe. All rights reserved.
//



@interface NSDictionary (MAExtension)

@end

@interface NSDictionary (PurifyObjectForKey)

- (id)purifyObjectForKey:(id)key;

- (NSString *)purifyStringForKey:(id)key;

- (BOOL)isExitNullValue;

@end

@interface NSMutableDictionary (MASafe)

- (void)safeSetValue:(id)value forKey:(NSString *)key;

@end
