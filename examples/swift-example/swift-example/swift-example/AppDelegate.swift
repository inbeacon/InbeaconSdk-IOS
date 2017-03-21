//
//  AppDelegate.swift
//  swift-test
//
//  Created by rvw on 22-3-2016.
//  Copyright © 2016 inBeacon. All rights reserved.
//

import UIKit
import InbeaconSdk
import AdSupport

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // OPTIONAL: chance the logging level 0=verbose, 1=debug, 2=info, 3=warning, 4=error 5=severe(default) 6=none
        InbeaconSdk.sharedInstance.logLevel = .error
        
        // REQUIRED: initialize InbeaconSdk with credentials
        let inbeaconInstance = InbeaconSdk.createWith(clientId: "demo", clientSecret:  "QmE3WWlMNUluUnp2Y2h1MUF4NFpJQ01aZ2ZCRnVGbng")
        
        // RECOMMENDED: Use IDFA - Only if your app is allowed to use IDFA. See Apple appstore rules for IDFA use.
        inbeaconInstance.IDFA = ASIdentifierManager.shared().advertisingIdentifier?.uuidString
        
        inbeaconInstance.refresh()
        
        return true
    }
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        print("SwiftApp ------------------------------> didreceivelocalnotification")
        
        // REQUIRED: didReceiveLocalNotification to InbeaconSdk
        InbeaconSdk.sharedInstance
            .didReceiveLocalNotification(notification)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

