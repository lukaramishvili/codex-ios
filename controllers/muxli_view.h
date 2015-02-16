//
//  muxli_view.h
//  codex
//
//  Created by Luka on 8/20/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "muxli.h"
#import "Socialize.h"

@interface muxli_view : UIViewController

@property muxli* muxliItem;

@property (nonatomic, retain) SZActionBar *actionBar;
@property (nonatomic, retain) id<SZEntity> entity;

@end
