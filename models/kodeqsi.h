//
//  kodeqsi.h
//  codex
//
//  Created by Luka on 7/29/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface kodeqsi : NSObject

@property int id;
@property NSString *title;
@property NSMutableArray* tavebi;

- (id) init;

+ (NSMutableArray *)getAll;

+ (kodeqsi *) fromJson :(NSDictionary*)src;

@end
