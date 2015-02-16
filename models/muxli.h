//
//  muxli.h
//  codex
//
//  Created by Luka on 7/29/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "tavi.h"

@interface muxli : NSObject

@property int id;
@property int tavi_id;
@property NSString *title;
@property NSString *text;

+ (muxli *) fromJson :(NSDictionary*)src;

- (tavi *) getTavi;

@end
