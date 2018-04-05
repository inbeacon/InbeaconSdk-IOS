## Documentation

Read the [full documentation](documentation/README.md)

## Basic implementation

1. The Resono inBeacon SDK is available trough [CocoaPods](http://cocoapods.org). To install
it, add the following line to your Podfile: 

	```ruby
	pod "InbeaconSdk", '~> 2.3'  
	```

1. Get your `client-ID` and `client-Secret` from your [Resono account page](https://console.inbeacon.nl/account) and use these  credentials to configure your app.


1.   Add text items `NSLocationAlwaysUsageDescription` and `NSLocationAlwaysAndWhenInUseUsageDescription` to the custom iOS target Properties in your plist "info" section.
	Both should contain a custom text, for example:

	>Without this, the app never asks for permission to use location and inBeacon won’t function!

1. Edit your AppDelegate.swift or AppDelegate.h/AppDelegate.m



#### AppDelegate.swift
```swift
import UIKit
import InbeaconSdk
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		InbeaconSdk.createWith(clientId: "<your client-ID>", clientSecret:  "<your client-Secret")
		if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
       } 
		return true
    }
    
    @available(iOS 10.0, *)
	func userNotificationCenter(_ center: UNUserNotificationCenter,didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        If !InbeaconSdk.sharedInstance.didReceiveUserNotification(response.notification) {
                  // not handled by inbeaconSdk..
        }
        completionHandler()
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .alert, .sound])
    }
}
```
#### AppDelegate.h
```objc
#import <UIKit/UIKit.h>
#import <inBeaconSdk/inBeaconSdk.h>
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UNUserNotificationCenterDelegate>
@property (strong, nonatomic) UIWindow *window;
@end
```
#### AppDelegate.m

```objc
#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions {

    [InbeaconSdk createWithClientID: @"<your client-ID>" andClientSecret: @"<your client-Secret>"]; 
    [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)(void))completionHandler {
         
    [InbeaconSdk.sharedInstance didReceiveUserNotification: response.notification];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {

    completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionAlert );
}

@end
```

