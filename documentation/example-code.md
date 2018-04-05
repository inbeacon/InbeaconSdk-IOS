### Full code examples for minimal setup:

### Swift

#### `File: AppDelegate.swift`

```swift
import UIKit
import InbeaconSdk
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate  {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
        InbeaconSdk.createWith(clientId: "<your client-ID>", clientSecret: "<your client-Secret")
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
        }
        
        return true
    }

    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        InbeaconSdk.sharedInstance.didReceiveUserNotification(response.notification)
        completionHandler()
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .alert, .sound])
    }
}
```

### Objective-C

#### `File: AppDelegate.h`
```objc
#import <UIKit/UIKit.h>
#import <inBeaconSdk/inBeaconSdk.h>
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UNUserNotificationCenterDelegate>
@property (strong, nonatomic) UIWindow *window;
@end

```

#### `File: AppDelegate.m`
```objc
#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [InbeaconSdk createWithClientID: @"<your client-id>" andClientSecret: @"<your client-secret>"];  
    [UNUserNotificationCenter currentNotificationCenter].delegate=self; 
    return YES;
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)(void))completionHandler {
         
    [InbeaconSdk.sharedInstance didReceiveUserNotification: response.notification];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
         
    completionHandler( UNNotificationPresentationOptionSound | 
						UNNotificationPresentationOptionBadge | 
						UNNotificationPresentationOptionAlert );
}

@end
```

`Previous:` [Using the SDK](using-the-sdk.md) `Next:` [Troubleshooting](troubleshooting.md)  