//
//  AppDelegate.m
//  objc-example
//
//  Created by rvw on 13-03-2018.
//  Copyright © 2018 rvw. All rights reserved.
//

#import "AppDelegate.h"
#import <AdSupport/ASIdentifierManager.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // OPTIONAL: chance the logging level InbLogLevelVerbose, InbLogLevelDebug, InbLogLevelInfo, InbLogLevelWarning, InbLogLevelError, InbLogLevelSevere(default) or InbLogLevelNone
    // InbeaconSdk.sharedInstance.logLevel = InbLogLevelDebug;
    
    // OPTIONAL: postpone asking for permissions
    // InbeaconSdk.sharedInstance.askPermissions = NO;
    
    // OPTIONAL: set the device PPID with your Publisher Provided ID
    // InbeaconSdk.sharedInstance.PPID = @"your PPID for this device";
    
    // REQUIRED: initialize InbeaconSdk with credentials -- replace the demo credentials with your own values.
    InbeaconSdk *inbeacon=[InbeaconSdk createWithClientID: @"demo" andClientSecret: @"QmE3WWlMNUluUnp2Y2h1MUF4NFpJQ01aZ2ZCRnVGbng"];
    
    // RECOMMENDED: Use IDFA - Only if your app is allowed to use IDFA. See Apple appstore rules for IDFA use. You might use PPID's instead
    inbeacon.IDFA = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];

    // OPTIONAL: get the device PPID. If you set it yourself, this will be your PPID, otherwise it will be a generated PPID by the SDK
    NSLog(@"inbeaconSDK PPID:%@", inbeacon.PPID);
    
    if (@available(iOS 10, *)) {
        // REQUIRED: We need a UserNotificationCenter delegate to handle notifications
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
    }
    return YES;
}

// REQUIRED: let InbeaconSDK handle its notifications
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    [InbeaconSdk.sharedInstance didReceiveUserNotification: response.notification];
}

// RECOMMENDED: Show notification even when app is in foreground
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    completionHandler(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
