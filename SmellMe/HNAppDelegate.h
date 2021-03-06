//
//  HNAppDelegate.h
//  SmellMe
//
//  Created by frostyhot on 14-2-10.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HNAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void)test001;
- (void)test002;
- (void)test003;
- (void)test004;
- (void)test005;
- (void)test006;
- (void)test007;
@end
