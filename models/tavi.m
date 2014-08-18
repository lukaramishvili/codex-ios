//
//  tavi.m
//  codex
//
//  Created by Luka on 7/29/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import "tavi.h"
#import "muxli.h"
#import "Helpers.h"

@implementation tavi

- (id) init {
    self = [super init];
    if(self){
        self.muxlebi = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (tavi *)fromJson:(NSDictionary *)src {
    tavi *cur = [[tavi alloc] init];
    cur.id = [src[@"tid"] intValue];
    cur.kodeqsi_id = [src[@"parents"][0] intValue];
    cur.title = src[@"name"];
    //add enclosed muxlebi
    [cur fetchMuxlebi];
    return cur;
}

- (void) fetchMuxlebi {
    NSDictionary* jsonMuxlebi = [Helpers fetchJson
                    :[NSString stringWithFormat:@"http://api.lcggroup.ge/codex?tid=%d", self.id] ];
    
    for(NSString* i in jsonMuxlebi){
        [self.muxlebi addObject:[muxli fromJson :jsonMuxlebi[i] ]];
    }
}

@end
