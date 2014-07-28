//
//  ge_luka_codexAppDelegate.h
//  codex
//
//  Created by Luka on 7/28/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ge_luka_codexAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
