//
//  TMGTAppDelegate.h
//  Time Management
//
//  Created by Hou Yongchao on 14-7-26.
//  Copyright (c) 2014年 Hou Yongchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMGTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel  *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistantStoreCoordinator;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
