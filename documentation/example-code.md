### Full code examples for minimal setup:

#### `File: AppDelegate.swift`

```swift
// Swift
import UIKit
import InbeaconSdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        InbeaconSdk.createWith(clientId: "<your client-ID>", clientSecret: "<your client-Secret")
        return true
    }

    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        InbeaconSdk.sharedInstance.didReceiveLocalNotification(notification)
    }
}
```

#### `File: AppDelegate.m`
```objc
// Objective-C

#import "AppDelegate.h"
@import InbeaconSdk;

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [InbeaconSdk createWithClientID: @"<your client-id>" andClientSecret: @"<your client-secret>"];   
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [InbeaconSdk.sharedInstance didReceiveLocalNotification:notification];
}
```

`Previous:` [Using the SDK](using-the-sdk.md) `Next:` [Troubleshooting](troubleshooting.md)  