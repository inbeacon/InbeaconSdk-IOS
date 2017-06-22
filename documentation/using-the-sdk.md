The InbeaconSdk class is the central point for accessing the inBeacon SDK.

```objc  
// Swift
import InbeaconSdk
```
```objc
// Objective-C
#import <InbeaconSdk/InbeaconSdk.h>
```

### InbeaconSdk.CreateWith(ClientID:  ClientSecret:)
Initialize the SDK with your credentials. This will create a singleton instance that is always accessible using `InbeaconSdk.sharedInstance` 

```swift
//Swift
class func createWith(clientId: "<your client-ID>",clientSecret: "<your client-secret>") -> InbeaconSdk
```
```objc
//Objective-C
+(inBeaconSdk *) createWithClientID: (NSString *)clientId andClientSecret: (NSString *) clientSecret
```

Initialize the SDK with your clientID and clientSecret. These credentials are used for communication with the server.
You can find your client-ID and client-Secret in your [account overview](http://console.inbeacon.nl/accmgr) 
  
>Example:
>Initialize the SDK in your appdelegate in the `didFinishLaunchingWithOptions` method as follows:
>
```swift
  //Swift
  func application(application: UIApplication,didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         InbeaconSdk.createWith(clientId: "<your client-ID>",clientSecret:  "<your client-secret>")
         ...
  }
```
```objc
  //Objective-C
  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions {
      [InbeaconSdk createWithClientID: @"<your client-ID>" andClientSecret: @"<your client-Secret>"];     
      …
  }
```

### sharedInstance

`inbeaconWithClientID:andClientSecret` returns a singleton instance. You can always obtain this instance by using:

```objc
//Swift and Objective-C
InbeaconSdk.sharedInstance
```
>Example:
>increase logging by setting the loglevel to verbose:
```swift
// Swift
InbeaconSdk.sharedInstance.logLevel = .Verbose
```
```objc
// Objective-C
InbeaconSdk.sharedInstance.logLevel = InbLogLevelVerbose;
```

### didReceiveLocalNotification()
You need to forward localnotifications to the inBeacon SDK by putting an extra method in your appdelegate:
```swift
//Swift
func didReceiveLocalNotification(_ notification: UILocalNotification) -> Bool
```
```objc
//Objective-C
- (BOOL)didReceiveLocalNotification:(UILocalNotification *)notification
```
>Example:
Forward the localnotification  in your appdelegate in the didReceiveLocalNotification method as follows:
```swift
//Swift
func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
    if !InbeaconSdk.sharedInstance.didReceiveLocalNotification(notification) {
            // not handled by inbeaconSdk, so we need to handle it ourselves (or not..)
    }
}
```
```objc
//Objective-C
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
      if (![InbeaconSdk.sharedInstance didReceiveLocalNotification:notification]) {
            // not handled by inbeaconSdk, so we need to handle it ourselves (or not..)
      }
  }
```


### didReceiveUserNotification()
>New in xCode 8 / iOS 10

Working with the new iOS 10 UserNotification framework? In that case you can replace the `didReceiveLocalNotification` as described above with a call to `didReceiveUserNotification`
```swift
//Swift
func didReceiveUserNotification(_ notification: UNNotification) -> Bool
```
```objc
//Objective-C
- (BOOL) didReceiveUserNotification: (UNNotification *) notification
```
>Example  
>Forward the notification in your UserNotification delegate as follows:
```swift
//Swift
func userNotificationCenter(_ center: UNUserNotificationCenter,didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        If !InbeaconSdk.sharedInstance.didReceiveUserNotification(response.notification) {
                  // not handled by inbeaconSdk, so we need to handle it ourselves (or not..)
        }
        completionHandler()
  }
```
```objc
//Objective-C
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    [InbeaconSdk.sharedInstance didReceiveUserNotification: response.notification];
}
```

### logLevel
The SDK can log detailed information to the console, but the amount is controlled by the logLevel. By default, the logLevel is set to `Severe`, but you can increase the loglevel by setting it:

```swift
//Swift
InbeaconSdk.sharedInstance.logLevel = .verbose

enum InbLogLevel: Int, Comparable, CustomStringConvertible {
    case verbose = 0
    case debug
    case info
    case warning
    case error
    case severe
    case none
}
```
```objc
//Objective-C

InbeaconSdk.sharedInstance.logLevel =InbLogLevelVerbose;

typedef enum {
  InbLogLevelVerbose = 0,
  InbLogLevelDebug,
  InbLogLevelInfo,
  InbLogLevelWarning,
  InbLogLevelError,
  InbLogLevelSevere,
  InbLogLevelNone
} InbLogLevel;
```

- Logging info is logged in the xcode output console. 
- The logging level is persistent. It is stored on the device.
- The InbLogLevel enum is CustomStringConvertible, so with Swift  it is possible to display the value as a string:
```swift
//Swift
print("Current loglevel: \(InbeaconSdk.sharedInstance.logLevel)")
```
```objc
//Objective-C
NSLog(@”Current loglevel %d”, InbeaconSdk.sharedInstance.logLevel);
```

> You can increase the loglevel before calling `CreateWithClientID: ClientSecret:`  to see the complete logdump.

### IDFA

The IDFA ("id for advertisers") can be used if you want to add functionality like Ad-retargeting. 

An app can’t always use the IDFA and apple might reject your app if the requirements for IDFA use are not followed. For this reason, obtaining the IDFA is kept out of the SDK, and you need to supply it yourself. You might do this right after or before `CreateWithClientID: ClientSecret:`

```swift
//Swift
InbeaconSdk.sharedInstance.IDFA = ASIdentifierManager.shared().advertisingIdentifier?.uuidString
```
```objc
//Objective-C
InbeaconSdk.sharedInstance.IDFA = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
```

> you need to specify the use of the IDFA on app submission. 

### User properties and tags

The inBeacon backend has user information for each device. The user information are properties that fall in any of the 3 categories:

* Fixed properties. These always exist and control specific functionality. These are the fixed properties
  - `name`: Full user name, both first and family name. Example ‘Dwight Schulz’
  - `email`: User email. Example: ‘dwight@a-team.com’
  - `gender`: User gender: male, female or unknown
  - `country`: ISO3166 country code
  - `id`: inBeacon unique user id (read-only)
  - `avatar`: URL to user avatar

* Custom properties. You can define other properties, like "facebook-ID" or “age”

* Tags. Users can be tagged, a tag is basically a property without a value

User properties are **persistent** on the device, and also **automatically synchronized with the backend** and thus will even **survive an app re-install**(on both iOS and Android)

Replication with the backend works both ways: Local updates are send to the server, server updates are send to the backend. Because the device initiates the communication, updates from server to device do not occur immediately but will have to wait until the device starts the next communication cycle.

> Note: Properties cannot be removed once created. 

```Swift
//Swift

//Get and set user properties using a subscript on the user property of the inbeacon instance:
Let email:String?=InbeaconSdk.sharedInstance.user["email"]
InbeaconSdk.sharedInstance.user[“name”]=”jean”

//User properties can be String, Int, Double or Bool:

let age:Int = InbeaconSdk.sharedInstance.user[“age”]
let bodyweight:Double = InbeaconSdk.sharedInstance.user[“weight”]
let isMember:Bool = InbeaconSdk.sharedInstance.user[“ismember”]
```
```objc
//Objective-C

//Get and set user properties using methods on the inbeacon instance:
NSString *email = [InbeaconSdk.sharedInstance userStringForKey: @"email"];
[InbeaconSdk.sharedInstance setUserString: @“jean” forKey: @"name"];

//User properties can be NSString or NSNumber:
NSNumber *age = [InbeaconSdk.sharedInstance userNumberForKey: @"age"]
[InbeaconSdk.sharedInstance setUserNumber: @79.9 forKey: @"weight"];
```


>When user properties change (for instance when modified on the backend or via an API REST call to the inBeacon server ), a **inb:userinfo** notification is send, which you can process like this:
```swift
//Swift
NSNotificationCenter.default.addObserver(self, selector: #selector(userInfoUpdated), name: 
//
Notification.Name(rawValue:"inb:userinfo"), object: nil)
@objc func userInfoUpdated(notification: Notification) {
       guard let userInfo:Dictionary<String,String?> = (notification.userInfo as? Dictionary<String,String?>) else {
            return
       }
       switch (userInfo["key"] ?? "")! As String {
       case "name"?:
         let newname:String = InbeaconSdk.sharedInstance.user["name"] ?? ""
       default:
         break
       }
    }
```
```objc
//Objective-C
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onUserInfoChange:) name:@"inb:userinfo" object:nil];
//
-(void)onUserInfoChange:(NSNotification*)notification {
    NSDictionary *changed=[notification userInfo];
    NSString *key=[changed objectForKey:@"key"];
    if ([key isEqualToString: @"name"]) {
       // name property changed
       NSString *newname= [inbeacon userStringForKey: @"name"];
    }
}
```

#### Tags

For tags, separate methods are used: hasTag, setTag and resetTag.
```swift
//Swift
func hasTag(tag) -> Bool
func setTag(tag: String)
func resetTag(tag: String)

//Example:
if InbeaconSdk.sharedInstance.user.hasTag("test") {
   …
}
InbeaconSdk.sharedInstance.user.setTag(“test”)
InbeaconSdk.sharedInstance.user.resetTag(“test”)
```
```objc
//Objective-C

if ([InbeaconSdk.sharedInstance userHasTag: @”test”]){
  ...
}
[InbeaconSdk.sharedInstance userSetTag: @”test”];
[InbeaconSdk.sharedInstance userResetTag: @”test”];
```

### checkCapabilitiesAndRights
Helper method to see if the app has the rights to run location and notification services and test if bluetooth is turned on. Returns nil if there is no problem, or an NSError object is returned that contains information about the issue

```swift
//Swift

guard let error : NSError = InbeaconSdk.sharedInstance.checkCapabilitiesAndRights() else {
     return  // all OK
}
// we have an NSError
error.userInfo["description"] as? String
error.userInfo["action"] as? String
```
```objc
//Objective-C

NSError *error = [InbeaconSdk.sharedInstance checkCapabilitiesAndRights];
if (error) {
   ...
}
```
Errors can be one of the following (not localized, english only)
- Location services are off. Please go to settings->location services and turn location services on for this app
- Bluetooth is turned off. Please go to settings and turn bluetooth on
- Notifications are off. Please go to settings->notifications and allow notifications for this app

>Do not call this right after first time app install as user permissions can be asked by iOS at that moment and will only become available after the user has responded to those questions. A good place to test this is on applicationWillEnterForeground

### checkCapabilitiesAndRightsWithAlert
A very basic method to show the user the action to take when something is not OK.

Shows an alert like this, based on **checkCapabilitiesAndRights**

![image alt text](https://github.com/inbeacon/InbeaconSdk-IOS/blob/master/documentation/image_15.png)

```swift
//Swift
InbeaconSdk.sharedInstance.checkCapabilitiesAndRightsWithAlert()
```
```objc
//Objective-C
[InbeaconSdk.sharedInstance checkCapabilitiesAndRightsWithAlert];
```

## Sending custom events or touchpoints

The SDK supports custom events. For example these can be used for:

* custom spot types that generate events just like beacons or geofences
* other types of events, for instance certain user actions inside the app

Different event-types are supported:

- eventtype **ONESHOT**. ("io") For unrelated events, a oneshot event is not connected to other events, and no time-spend is calculated.
- eventtype **IN** ("i") and **OUT** ("o"). For in/out eventtypes, a time-spend is calculated for example to measure dwell times. Also the in and out events are connected and kept for "currently in" and "currently not in" status calculation based on the eventID. A device can be inside more than one eventID at the same time.

Custom events can be used in the campaign designer and are stored as touchpoints and can be used in touchpoint analysis.

A custom event has 3 properties:

- an ID. The eventID should be defined in the inbeacon backend, otherwise triggering it will be ignored.
- an eventType, which can be IN, OUT or ONESHOT. 
- (optional) extra data. This is a string with extra data for custom purposes to give more context.

#### Triggering (sending) a custom event
There are 2 ways to trigger a custom event: Via an SDK method or with a notification

##### via an SDK method: triggerCustomEvent()

```swift
func triggerCustomEvent(id: Int, ioType: String, extra: String) 
```
>Example: 
>
```swift
InbeaconSdk.sharedInstance.triggerCustomEvent(id: 44, 
												ioType: "i", // i,o or io
												extra: "extradata");
```

##### via a notification
>Example:
>
```swift
	//Swift
   NotificationCenter.default.post(
    		name: Notification.Name(rawValue: "inb:customevent"), 
    		object: nil, 
    		userInfo: ["id":"44", "io": "i" ,"extra": "extradata"]
	)
```
```objc
	// Objective-C
   [[NSNotificationCenter defaultCenter]
     postNotificationName:@"inb:customevent"
     object:self
     userInfo: @{@"id":@"44", @"io":@"i", @"extra":@"extradata"} ];
```    

## SDK events

The SDK sends notifications using the NSNotification mechanism. You can receive these events by creating an observer to the event, example:

```swift
//Swift
NSNotificationCenter.default.addObserver(self, selector: #selector(userInfoUpdated), name: Notification.Name(rawValue:"inb:userinfo"), object: nil)
//
@objc func userInfoUpdated(notification: NSNotification) {
  guard let data:Dictionary<String,String?> = (notification.userInfo as? Dictionary<String,String?>) else {
         return  // must be wrong
  }
  ...
}
```
```objc
//Objective-C
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onUserInfoChange:) name:@"inb:userinfo" object:nil];
//
-(void)onUserInfoChange:(NSNotification*)notification {
  NSDictionary *data=[notification userInfo];
}
```

>### Best practices
>1. If you want your app to react on a beacon, location or geofence first check out the standard options that the inBeacon SDK offers out of the box. You can send local notifications and show webviews, images, video’s and more without using the SDK events at all. Go to the inBeacon campaign manager and set up a trigger with an action and a view.

>2. If you want to react on a beacon, location or geofence and use the notifications to handle this yourself, consider the `inb:AppEvent` first.  You can set up all beacon, location and geofence triggers in the campaign manager and launch an `inb:AppEvent` when the user opens the local notification. This is easy and flexible, as you can change the trigger later on without changing your app. Use a specific app-event-argument for specific actions, like showing a certain page.

>3. As a last resort you might react to `inb:location`, `inb:proximity` or `inb:geofence` events.

All events start with inb: for namespacing purposes

### `inb:AppEvent`
An app-event action has been triggered.
```
Userinfo:
[
"id": triggerId, (id of the trigger block)
"argument": appArgument
]
```
You can define an app-event in the campaign designer:

The argument that is supplied corresponds with the app-argment as given in the send-application-event box (xyzzy in this example)

You can use for instance a page-ID as app-argument to jump to a specific page location in your app.

### `inb:userinfo`
A user property has been changed by the backend
```
[
"Key": user-property  
]
```

### `inb:region`
Send when entering or leaving a region (set of beacons with the same UUID)

Userinfo:

```
[
"rid": <id of region>,
"io": "i" or “o” ,
"uuid": region.UUIDString
]
```

### `inb:location`
Send when entering or leaving a location (set of beacons with the same UUID and major)

```
[
"uuid": uuid.UUIDString,
"major": String(major),
"io": “i” or “o”  
]
```
 
### `inb:proximity`
send when entering or leaving a proximity range

```
[
"uuid":uuid.UUIDString,
"major":String(major),
"minor":String(minor),
"Io": In.rawValue,   // “i” or “o”
"prox":prox.rawValue // “N”, “F”, “I” (near/far/imm)
]
```

### `inb:geofence`
Send when entering or leaving a geofence

Userinfo:

```
[
"Fid":id,            // geofence ID see inbeacon beackend
"io": io.rawValue    // “i” or “o”
]
```

### `inb:trigger`
>(internal notification)

Send when an offline trigger is fired 
 
```
[
"Id":id              // trigger ID see inbeacon backend
]
```

### `inb:didreceivelocalnotification`
>(internal notification)

Send when a local notification is opened that was initiated by inbeacon.

```
[
"tid": trigger id    // trigger ID see inbeacon backend
]
```

---
Instead of using the inb:region, inb:proximity, inb:location, inb:geofence or inb:trigger events, it is more flexible and easier to have your app react on inb:AppEvent and set up the corresponding trigger in the campaign designer.

`Previous:` [Installing the SDK](installing-the-sdk.md)   `Next:` [Simple example, minimal setup](example-code.md)
