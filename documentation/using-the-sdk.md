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
You can find your client-ID and client-Secret in your [account overview](https://console.inbeacon.nl/account) 
  
>Example:
>Initialize the SDK in your appdelegate in the `didFinishLaunchingWithOptions` method as follows:

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

### didReceiveUserNotification()
You need to forward usernotifications to the inBeacon SDK by putting an extra method in your UserNotification delegate:


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
The SDK can log detailed information to the console, but the amount is controlled by the logLevel. By default, the logLevel is set to `Severe`, but you can increase the loglevel by setting it.

- Logging info is logged to the xcode output console and app console

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



You can increase the loglevel before calling `CreateWithClientID: ClientSecret:`  to see the complete logdump.

```swift
//Swift
InbeaconSdk.sharedInstance.logLevel = .info
InbeaconSdk.createWith(clientId: "<your client-ID>",clientSecret:  "<your client-secret>")  
```
```objc
//Objective-C
InbeaconSdk.sharedInstance.logLevel = InbLogLevelInfo;
InbeaconSdk.createWith(clientId: "<your client-ID>",clientSecret:  "<your client-secret>")
```


- The InbLogLevel enum is CustomStringConvertible, so with Swift  it is possible to display the value as a string:

```swift
//Swift
print("Current loglevel: \(InbeaconSdk.sharedInstance.logLevel)")
```
```objc
//Objective-C
NSLog(@”Current loglevel %d”, InbeaconSdk.sharedInstance.logLevel);
```

### askPermissions
By default, the SDK asks user permissions (notifications, location) immediately. However there are cases where the app wants to control the permission dialogs itself. In that case you can set askPermissions to *false* just before initialization of the SDK. 

The app can now ask for permissions on appropriate moments. Note that the SDK needs location **ALWAYS** authorization by calling requestAlwaysAuthorization(), otherwise beacon and geofence functionality does not work.

```swift
//Swift
  
// disable askPermissions, just before initializing the SDK
InbeaconSdk.sharedInstance.askPermissions = false
InbeaconSdk.createWith(clientId: "<your client-ID>",clientSecret:  "<your client-secret>")  

...

// Later on, ask user permissions at any moment you like. 
// Doing this will ask the user for notification and location permissions immediately
InbeaconSdk.sharedInstance.askPermissions = true

// or ask for permissions yourself at an appropriate time
let locationManager = CLLocationManager()  
locationManager.requestAlwaysAuthorization()
UIApplication.shared.registerUserNotificationSettings(
    UIUserNotificationSettings.init(types: [.badge,.alert,.sound], categories: nil )
)

```
```objc
//Objective-C

// disable askPermissions, just before initializing the SDK
InbeaconSdk.sharedInstance.askPermissions = false;
InbeaconSdk.createWith(clientId: "<your client-ID>",clientSecret:  "<your client-secret>")

...

// Later on, ask user permissions at any moment you like. 
// Doing this will ask the user for notification and location permissions immediately
InbeaconSdk.sharedInstance.askPermissions = true

// or ask for permissions yourself at an appropriate time
[locationManager requestWhenInUseAuthorization];
UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert 
      | UIUserNotificationTypeBadge 
      | UIUserNotificationTypeSound) categories:nil];
[application registerUserNotificationSettings:settings];
```
> Apple allows the app to ask user permissions only once. After this is done, the setting of askPermissions does not matter any more.

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

### PPID

An alternative for the IDFA is to roll your own Publisher Provided ID. If you use Doubleclick For Publishers (DFP), a PPID might be a better option than using an IDFA. A PPID is a ID that is attached to the App on a Device that can be used for retargeting. 

In addition to your own PPID's, the SDK will generate a unique ID, based on the device and app bundle. This can function as a PPID if you do not want to create your own. This PPID will survive app re-installs. The PPID provided by the SDK will be a UUID.

> See [Google DFP documentation on PPID's](https://support.google.com/dfp_premium/answer/2880055?hl=en)

The PPID is available as a read/write property of the SDK instance:

```swift
//Swift
InbeaconSdk.sharedInstance.PPID = "your PPID for this device"  // OPTIONAL
let ppid=InbeaconSdk.sharedInstance.PPID

```
```objc
//Objective-C
InbeaconSdk.sharedInstance.PPID = @"your PPID for this device"; // OPTIONAL
NSLog(@"inbeaconSDK PPID:%@", InbeaconSdk.sharedInstance.PPID);
```


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


### GDPR Compliant User opt-out and forget
Due to european GDPR rules, a user must have an option to be opted-out and all trackingdata be removed.
If this option is set, all data of this user will be removed from the servers and no new data will be stored.

If the user wants to opt-in again, this can be set with userOptIn (this is default). This will resume tracking by the inBeacon SDK


```swift
//Swift
InbeaconSdk.sharedInstance.userOptOutAndForget()
InbeaconSdk.sharedInstance.userOptIn()	
```
```objc
//Objective-C
[InbeaconSdk.sharedInstance userOptOutAndForget];
[InbeaconSdk.sharedInstance userOptIn];
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


All events start with inb: for namespacing purposes

### `inb:AppEvent`
An app-event action has been triggered from the campaign-designer.
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
A user property has been changed after a resync is done, A user property can be changed on the backend or on the device. The resync works both ways.
```
[
"Key": user-property  
]
```


`Previous:` [Installing the SDK](installing-the-sdk.md)   `Next:` [Simple example, minimal setup](example-code.md)
