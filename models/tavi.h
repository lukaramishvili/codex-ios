//
//  tavi.h
//  codex
//
//  Created by Luka on 7/29/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tavi : NSObject

@property int id;
@property int kodeqsi_id;
@property NSString *title;
@property NSMutableArray* muxlebi;

- (id) init;

+ (tavi *) fromJson :(NSDictionary*)src;

+ (tavi *) byId :(int) tavi_id;

- (void) fetchMuxlebi;

@end
