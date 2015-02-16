//
//  muxli.m
//  codex
//
//  Created by Luka on 7/29/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import "muxli.h"

@implementation muxli

+ (muxli *)fromJson:(NSDictionary *)src {
    muxli *cur = [[muxli alloc] init];
    cur.id = [src[@"nid"] intValue];
    cur.tavi_id = [src[@"head"][@"tid"] intValue];
    cur.title = src[@"title"];
    cur.text = src[@"body"];
    return cur;
}

- (tavi *) getTavi {
    return [tavi byId :self.tavi_id];
}

@end
