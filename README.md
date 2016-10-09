## Documentation

See the Wiki for the [full documentation](https://github.com/inbeacon/InbeaconSdk-IOS/wiki)

## Basic implementation

1. The Inbeacon SDK is available trough [CocoaPods](http://cocoapods.org). To install
it, add the following line to your Podfile: (use version 2.0.x for xCode 7, 2.1.x and higher for xCode 8)

	```ruby
	pod "InbeaconSdk", '~> 2.1'  
	```

1. Get your `client-ID` and `client-Secret` from your [inBeacon account page](https://console.inbeacon.nl/accmgr) and use these  credentials to configure your app.


1.   Add a text item `NSLocationAlwaysUsageDescription` to the custom iOS target Properties in your plist "info" section.
	NSLocationAlwaysUsageDescription should contain a custom text.   

	>Without this, the app never asks for permission to use location and inBeacon won’t function!

1. Edit your AppDelegate.swift / AppDelegate.m



#### AppDelegate.swift
```swift
import UIKit
import InbeaconSdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		InbeaconSdk.createWith(clientId: "<your client-ID>", clientSecret:  "<your client-Secret")
		return true
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
		InbeaconSdk.sharedInstance.didReceiveLocalNotification(notification)
    }
}
```
#### AppDelegate.m

```objc
#import <InbeaconSdk/InbeaconSdk.h>
...
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions {
    [InbeaconSdk createWithClientID: @"<your client-ID>" andClientSecret: @"<your client-Secret>"]; 
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [InbeaconSdk.sharedInstance didReceiveLocalNotification:notification];
}
```

