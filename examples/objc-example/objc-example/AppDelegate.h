//
//  AppDelegate.h
//  objc-example
//
//  Created by rvw on 13-03-2018.
//  Copyright © 2018 rvw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <InbeaconSdk/InbeaconSdk.h>
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

