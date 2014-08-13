//
//  kodeqsi.m
//  codex
//
//  Created by Luka on 7/29/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import "kodeqsi.h"
#import "Helpers.h"

@implementation kodeqsi

+ (NSMutableArray *)all {
    NSMutableArray* yvela = [[NSMutableArray alloc] init];
    
    NSDictionary* jsonCodexes = [Helpers fetchJson:@"http://api.lcggroup.ge/codex"];
    
    if(jsonCodexes){
        for(NSString* i in jsonCodexes){
            kodeqsi *cur = [[kodeqsi alloc] init];
            cur.id = i.intValue;
            cur.title = jsonCodexes[i][@"name"];
            [yvela addObject:cur];
        }
    } else {
        //no connection; try local storage
        //TODO: implement loading data from local storage
    }
    
    return yvela;
}


@end
