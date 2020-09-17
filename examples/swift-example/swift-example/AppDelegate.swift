//
//  AppDelegate.swift
//  swift-example
//
//  Created by rvw on 17-09-2020.
//

import UIKit
import InbeaconSdk
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate,  UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Fill in your credentials and initialize the SDK
        InbeaconSdk.sharedInstance.logLevel = .verbose
        InbeaconSdk.createWith(clientId: "yqjoG98S", clientSecret:  "TjZZUHlra0RQT3NBT0JGNjlLUFpLcEZDczFnMUU2WU4") // ronaldtest
        //InbeaconSdk.createWith(clientId: "put_your_clientid_here", clientSecret:  "put_your_secret_here")
        
        // make the AppDelegate also the delegate for UserNotifications
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        InbeaconSdk.sharedInstance.didReceiveUserNotification(response.notification)

        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .alert, .sound])
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

