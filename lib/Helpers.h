//
//  Helpers.h
//  codex
//
//  Created by Luka on 8/6/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helpers : NSObject


//+ means class method, - means instance method
+ (NSString *)getHttpResponse :(NSString *)url :(NSString *)method :(NSArray *)data;

+ (NSDictionary *)fetchJson :(NSString *)url;

+ (NSDictionary *)jsonFromString :(NSString *)strData;

+ (NSDictionary*)parseURLParams:(NSString *)query;

+ (BOOL)shareOnFB :(NSString *)name :(NSString *) caption :(NSString *) description
                  :(NSString *)link :(NSString *) picture;


@end
