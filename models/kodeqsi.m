//
//  kodeqsi.m
//  codex
//
//  Created by Luka on 7/29/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import "kodeqsi.h"
#import "tavi.h"
#import "Helpers.h"

@implementation kodeqsi

- (id) init {
    self = [super init];
    if(self){
        self.tavebi = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (NSMutableArray *)getAll {
    NSMutableArray* yvela = [[NSMutableArray alloc] init];
    
    NSDictionary* jsonCodexes = [Helpers fetchJson: [Helpers endpoint: @"/codex"]];
    
    if(jsonCodexes){
        for(NSString* i in jsonCodexes){
            [yvela addObject:[kodeqsi fromJson :jsonCodexes[i] ]];
        }
    } else {
        //no connection; try local storage
        //TODO: implement loading data from local storage
    }
    
    return yvela;
}

+ (kodeqsi *)fromJson:(NSDictionary *)src {
    kodeqsi *cur = [[kodeqsi alloc] init];
    cur.id = [src[@"tid"] intValue];
    cur.title = src[@"name"];
    //add enclosed tavebi
    NSDictionary* jsonTavebi = src[@"children"];
    for(NSString* i in jsonTavebi){
        [cur.tavebi addObject:[tavi fromJson :jsonTavebi[i] ]];
    }
    return cur;
}


@end
