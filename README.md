## Installation

Download the framework and put it in your Xcode project. 

## Configuring the app

Log in to the inBeacon backend [http://console.inbeacon.nl/](http://console.inbeacon.nl/) and go the the Extra/SDK page.
Copy your client-ID and client-Secret, with these you can initalize your app


## Usage

1. Add descriptions for the use of Location in the "custom iOS Target Properties" on the target "info" page of the plist. NSLocationAlwaysUsageDescription should contain a custom text. Without this property, the app never asks for permission and the SDK won't function!

2. (optional) set Background mode "location updates" if you want full background mode with continuous beacon ranging. 

3. Edit your AppDelegate.swift / AppDelegate.m

#### AppDelegate.m

```
#import <InbeaconSdk/InbeaconSdk.h>
...
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions: 
                                                 (NSDictionary *) launchOptions {

   inBeaconSdk *inbeacon=[inBeaconSdk inbeaconWithClientID: @"<your client­ID>"
                                           andClientSecret: @"<your client­secret>"];
                     
}
- (void)application:(UIApplication *)application 
                     didReceiveLocalNotification:(UILocalNotification *)notification {
                     
  [[inBeaconSdk getInstance] didReceiveLocalNotification:notification];    
}
```

#### AppDelegate.swift
```
import UIKit
import InbeaconSdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, 
didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
       inBeaconSdk.inbeaconWithClientID("xxxxx", andClientSecret: "xxxxx") return true
       return true
    }
    
    func application(application: UIApplication, 
didReceiveLocalNotification notification: UILocalNotification) {

     inBeaconSdk.getInstance().didReceiveLocalNotification(notification)
    }
}
```

## More information
Please go to the Extra/SDK page of the inBeacon backend for more detailed information


