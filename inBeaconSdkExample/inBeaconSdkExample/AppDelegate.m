//
//  AppDelegate.m
//  inBeaconSdkExample
//
//  Created by rvw on 2-8-2015.
//  Copyright (c) 2015 inBeacon. All rights reserved.
//

#import "AppDelegate.h"
#import <inBeaconSdk/inBeaconSdk.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

//////////////////////////////////////////// START OF EXAMPLE INBEACON INTEGRATION  ///////////////////////////////////////////////////////

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[inBeaconSdk getInstance] setLogLevel:1];  // 0=none 1=error 2=log 3=info 4=debug
    
    // use your own client-ID and client-Secret
    inBeaconSdk *inbeacon=[inBeaconSdk inbeaconWithClientID: @"demo" andClientSecret: @"QmE3WWlMNUluUnp2Y2h1MUF4NFpJQ01aZ2ZCRnVGbng"];
       
    // optional: if there is information about the current user name and/or other properties
    [inbeacon attachUser:@{@"name":@"Dwight Schulz", @"email":@"dwight@ateam.com"}];
    
    [inbeacon setLogLevel:3];
    
    // refresh synchronizes us with the inBeacon backend
    [inbeacon refresh];
    
    // optional: get notifications for app-events
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotification:) name:@"inb:locationsUpdate" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotification:) name:@"inb:beaconsUpdate" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotification:) name:@"inb:location" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotification:) name:@"inb:proximity" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotification:) name:@"inb:AppAction" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotification:) name:@"inb:AppEvent" object:nil];
    
    return YES;
    
}

// optional: get notifications for important inbeacon SDK events
-(void)onNotification:(NSNotification*)notification {
    NSLog(@"Received notificationcenter Notification name is %@ sent by %@ userinfo %@",[notification name], [[notification object] description], [notification userInfo] );

}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [[inBeaconSdk getInstance] didReceiveLocalNotification:notification];   // make sure local notifications pass through the inbeacon SDK
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Common practice to synchronize with the inBeacon backend when app enters foreground
    [[inBeaconSdk getInstance] refresh];
    
}

////////////////////////////////////////////// END OF EXAMPLE INBEACON INTEGRATION  /////////////////////////////////////////////////////

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
