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
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // OPTIONAL: chance the logging level .verbose, .debug, .info, .warning, .error .severe(default) .none
        // InbeaconSdk.sharedInstance.logLevel = .info
        
        // OPTIONAL: postpone asking for permissions
        // InbeaconSdk.sharedInstance.askPermissions = false
        
        // REQUIRED: initialize InbeaconSdk with credentials -- replace the demo credentials with your own values.
        //InbeaconSdk.createWith(clientId: "demo", clientSecret:  "QmE3WWlMNUluUnp2Y2h1MUF4NFpJQ01aZ2ZCRnVGbng")
        InbeaconSdk.createWith(clientId: "yqjoG98S", clientSecret:   "TjZZUHlra0RQT3NBT0JGNjlLUFpLcEZDczFnMUU2WU4") // ronaldtest
        
        // RECOMMENDED: Use IDFA - Only if your app is allowed to use IDFA. See Apple appstore rules for IDFA use.
        InbeaconSdk.sharedInstance.IDFA = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        
        // REQUIRED need a delegate for the UserNotificationCenter (as of iOS 10.0)
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
        }
        return true
    }
    
    // REQUIRED handling usernotifications
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if !InbeaconSdk.sharedInstance.didReceiveUserNotification(response.notification) {
            // notification not handled by inBeaconSDK
            // do your own handling here
        }
        completionHandler()
    }
    // RECOMMENDED show alert and sound even when app is in foreground
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // called before notification is shown
        completionHandler([.badge, .alert, .sound])
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

