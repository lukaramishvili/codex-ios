//
//  Helpers.m
//  codex
//
//  Created by Luka on 8/6/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import "Helpers.h"

@implementation Helpers


//+ means class method, - means instance method

///returns nil when the request fails
+ (NSString *)getHttpResponse :(NSString *)url :(NSString *)method :(NSArray *)data {
    if(method == nil) method = @"GET";
    
    NSString* ret = @"";
    
    //obj-c request code
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:method];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        //NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
        return nil;
    }
    
    ret = [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
    //end obj-c request code
    
    return ret;
}

///returns nil on fail
+ (NSDictionary *)fetchJson :(NSString *)url {
    //fetchJson only loads data, so doesn't need POST request
    NSString* method = @"GET";
    
    NSString* strJson = [Helpers getHttpResponse:url :method :nil];
    
    //returns nil when the request fails
    NSDictionary *jsonData = nil;
    if(strJson) { jsonData = [Helpers jsonFromString:strJson]; }
    
    return jsonData;
}


+ (NSDictionary *)jsonFromString :(NSString *)strData {
    
    NSData *nsJson = [strData dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:nsJson options:0 error:0];
    
    return jsonData;
}



































@end
