//
//  AppDelegate.m
//  objc-example
//
//  Created by rvw on 8-7-16.
//  Copyright © 2016 inBeacon. All rights reserved.
//

#import "AppDelegate.h"
#import <AdSupport/ASIdentifierManager.h>

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // OPTIONAL: chance the logging level InbLogLevelVerbose, InbLogLevelDebug, InbLogLevelInfo, InbLogLevelWarning, InbLogLevelError, InbLogLevelSevere(default) or InbLogLevelNone
    InbeaconSdk.sharedInstance.logLevel = InbLogLevelInfo;
    
    // REQUIRED: initialize InbeaconSdk with credentials -- replace the demo credentials with your own values.
    InbeaconSdk *inbeacon=[InbeaconSdk createWithClientID: @"demo" andClientSecret: @"QmE3WWlMNUluUnp2Y2h1MUF4NFpJQ01aZ2ZCRnVGbng"];
    
    // RECOMMENDED: Use IDFA - Only if your app is allowed to use IDFA. See Apple appstore rules for IDFA use.
    inbeacon.IDFA = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];

    return YES;
}

// REQUIRED: Need to catch local notifications.
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [InbeaconSdk.sharedInstance didReceiveLocalNotification:notification];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
