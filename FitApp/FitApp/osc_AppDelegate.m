//
//  osc_AppDelegate.m
//  FitApp
//
//  Created by MAC-04 on 10/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "osc_AppDelegate.h"
#import <Parse/Parse.h>
#import "OSC_Plan.h"
#import "OSC_Abs.h"
#import "OSC_Statistics.h"
#import "OSC_Biceps.h"
#import "OSC_Cycling.h"
#import "OSC_Footing.h"
#import "OSC_Pullups.h"
#import "OSC_Pushups.h"
#import "OSC_SkippingRope.h"
#import <GoogleMaps/GoogleMaps.h>

@implementation osc_AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
[GMSServices provideAPIKey:@"AIzaSyBvu62NpbFPRo473YrYZNg8gxWVuXKwSfU"];

    // Override point for customization after application launch.
    [Parse setApplicationId:@"NV15auAZTcAdcUuQ9MXb634Fzvhh8VhkmSAEz0Rg"
                  clientKey:@"Nqba8UMBISsw75B2KVMyK8IEWZtHgEHbtJMIZXHe"];
    
    [OSC_Plan registerSubclass];
    [OSC_Abs registerSubclass];
    [OSC_Biceps registerSubclass];
    [OSC_Cycling registerSubclass];
    [OSC_Pushups registerSubclass];
    [OSC_Footing registerSubclass];
    [OSC_Pullups registerSubclass];
    [OSC_Statistics registerSubclass];
    [OSC_SkippingRope registerSubclass];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    [PFFacebookUtils initializeFacebook];
    [self copyPlist];
    return YES;
}
- (void) copyPlist {
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory =  [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"isLoginList.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ( ![fileManager fileExistsAtPath:path] ) {
        NSLog(@"copying database to users documents");
        NSString *pathToSettingsInBundle = [[NSBundle mainBundle] pathForResource:@"isLoginList" ofType:@"plist"];
        [fileManager copyItemAtPath:pathToSettingsInBundle toPath:path error:&error];
    }
    else {
        NSLog(@"users database already configured");
    }
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [PFFacebookUtils handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [PFFacebookUtils handleOpenURL:url];
}

@end
