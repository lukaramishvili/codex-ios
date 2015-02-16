//
//  Helpers.m
//  codex
//
//  Created by Luka on 8/6/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import "Helpers.h"
#import <FacebookSDK/FacebookSDK.h>

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

// A function for parsing URL parameters returned by the Feed Dialog.
+ (NSDictionary*)parseURLParams:(NSString *)query {
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val =
        [kv[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        params[kv[0]] = val;
    }
    return params;
}

//usage: [Helpers shareOnFB :@"title" :@"caption" :@"description" :@"http://aa.ge/link" :@"http://aa.ge/assets/frontend/img/logo.png"];
+ (BOOL)shareOnFB :(NSString *)name :(NSString *) caption :(NSString *) description
                  :(NSString *)link :(NSString *) picture {
    FBLinkShareParams *params = [[FBLinkShareParams alloc] init];
    params.link = [NSURL URLWithString:@"https://developers.facebook.com/docs/ios/share/"];
    
    // If the Facebook app is installed and we can present the share dialog
    if ([FBDialogs canPresentShareDialogWithParams:params]) {
        // Present share dialog
        [FBDialogs presentShareDialogWithLink:params.link
            handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
                if(error) {
                    // An error occurred, we need to handle the error
                    // See: https://developers.facebook.com/docs/ios/errors
                    NSLog(@"Error publishing story: %@", error.description);
                } else {
                    // Success
                    NSLog(@"result %@", results);
                }
            }];
    } else {
        // Present the feed dialog
        // Put together the dialog parameters
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            name, @"name",
            caption, @"caption",
            description, @"description",
            link, @"link",
            picture, @"picture",
            nil];
                
        // Show the feed dialog
        [FBWebDialogs presentFeedDialogModallyWithSession:nil parameters:params
            handler:^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
          if (error) {
              // An error occurred, we need to handle the error
              // See: https://developers.facebook.com/docs/ios/errors
              NSLog(@"Error publishing story: %@", error.description);
          } else {
              if (result == FBWebDialogResultDialogNotCompleted) {
                  // User cancelled.
                  NSLog(@"User cancelled.");
              } else {
                  // Handle the publish feed callback
                  NSDictionary *urlParams = [self parseURLParams:[resultURL query]];
                  
                  if (![urlParams valueForKey:@"post_id"]) {
                      // User cancelled.
                      NSLog(@"User cancelled.");
                      
                  } else {
                      // User clicked the Share button
                      NSString *result = [NSString stringWithFormat: @"Posted story, id: %@", [urlParams valueForKey:@"post_id"]];
                      NSLog(@"result %@", result);
                  }
              }
          }
      }];
            }
    //
    return YES;
}

































@end
