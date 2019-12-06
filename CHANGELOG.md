#### 3.2.01 (06-Dec-2019)
- adapted to changed iOS 13 environment
- hyperfence sensitivity enhanced
- walkby and visit hyperfence types now supported
- battery life improvements
- Made with xcode 11.2.1


#### 3.1.05 (04-Nov-2019)
- xCode 11.2 / Swift 5.1.2 version
 

#### 3.1.04 (19-Sep-2019)
- cocapod issues
 

#### 3.1.03 (19-Sep-2019)
- podspec issue
 

#### 3.1.02 (19-Sep-2019)
- Removed coreBluetooth dependency from podspec
 

#### 3.1.01 (18-Sep-2019)
- removed coreBluetooth from SDK
 

#### 3.1.00 (17-Sep-2019)
- xCode 11 / Swift 5.1 / iOS 13 version
 

#### 3.0.05 (22-May-2019)
- Git rename limit solved for cocoaPod
 

#### 3.0.04 (22-May-2019)
- removed KLCpopup library as it was no longer used

 

#### 3.0.03 (23-Apr-2019)
- minor issues
 

#### 3.0.02 (23-Apr-2019)
- examples updated
 

#### 3.0.01 (23-Apr-2019)
- Major new release of the resono/inbeacon iOS SDK
- Support for hyperfences and microfences
- backend API level 6 implemented
- newest xCode 10.2.1 (10E1001) and Swift 5 version
- all dependencies updated (swiftyJson, keyChainWrapper)
- bugs fixed
 

#### 2.5.11 (28-Mar-2019)
- Updated swift and objective-c examples
 

#### 2.5.10 (28-Mar-2019)
- Xcode 10.2 / swift 5 version
 

#### 2.5.01 (06-Dec-2018)
- xCode 10.1 / swift 4.2.1 version


#### 2.5.00 (13-Sep-2018)
- Xcode 10, Swift 4.2 version
 

#### 2.4.02 (24-May-2018)
- PPID format now alfanumeric and 40 characters
 

#### 2.4.01 (08-May-2018)
- PPID format update
 

#### 2.4.00 (04-May-2018)
- PPID generator and property added
 

#### 2.3.01 (25-Apr-2018)
- re-introduced didReceiveLocalNotification for support of pre iOS-10 targets
 

#### 2.3.00 (30-Mar-2018)
- Support for Swift 4.1 / XCode 9.3 / iOS 11.3
- Removed support for deprecated UILocalNotification
- Removed didReceiveLocalNotification
- Changed examples to support UserNotifications
 

#### 2.2.07 (13-Mar-2018)
- new objc-example 

#### 2.2.06 (13-Mar-2018)
- Fresh obj-c example with Xcode 9.2
 

#### 2.2.05 (13-Mar-2018)
- rebuild 


#### 2.2.04 (19-Dec-2017)
- Xcode Version 9.2 (9C40b)
- minor fixes
 

#### 2.2.03 (27-Nov-2017)
- Logging now visible in console 
 

#### 2.2.02 (14-Nov-2017)
- Option to postpone asking for permissions by the SDK. More control of the permission dialogs by the app.
 

#### 2.2.01 (03-Nov-2017)
- XCode 9.1 / Swift 4.0.2 support
- Documentation about the new "Location Always and When In Use Usage Description"
- bugfixes
 

#### 2.2.00 (18-Sep-2017)
- xCode 9.0 (9A235) swift 4 version. 
- extra samples in objective-C example
 

#### 2.1.17 (22-Jun-2017)
- triggerCustomEvent / POI system included
- xCode 8.3.3
 

#### 2.1.16 (19-Apr-2017)
- Version generated with XCode 8.3.2

 

#### 2.1.15 (05-Apr-2017)
- postponed requestAlwaysAuthorization when it could not be asked (because of a pending requestWhenInUseAuthorization)


#### 2.1.14 (04-Apr-2017)
- synchronize with backend on permission change events


#### 2.1.13 (28-Mar-2017)
- iOS 10.3 / xCode 8.3 / Swift 3.1 version
 

#### 2.1.12 (21-Mar-2017)
- version bump


#### 2.1.11 (21-Mar-2017)
- cocoapod deployment target auto-sync with framework deployment target
 

#### 2.1.10 (21-Mar-2017)
- Lowered minimum deployment target to iOS 8.0
 

#### 2.1.10 (21-Mar-2017)
- 

#### 2.1.9 (10-Nov-2016)
- xCode 8.1 / Swift 3.0.1 

#### 2.1.8 (10-Oct-2016)
- Cocoapods searchability
- documentation moved to /documentation directory

#### 2.1.7 (10-Oct-2016)
- New documentation pages
- examples now included in the repository 

#### 2.1.6 (07-Oct-2016)
- Added bitcoded version of framework to repo
- Release and changelog info

#### 2.1.2
- Support for UserNotification framework in iOS 10

#### 2.1.0 (04-Oct-2016)
- Xcode 8 / swift 3 version

#### 2.0.4 (12-Aug-2016)
- Final Xcode 7 version

#### 2.0.1 (20-Jul-2016)
- Target iOS version brought back to 8.0 instead of 9.0
- Minor issues fixed

#### 2.0.0 (14-Jul-2016)
- Swift version of the inBeacon SDK
- New server protocol V5, more robust, efficient and with new features
- Dynamic and bitcode enabled framework
- Not compatible with 1.x.x frameworks. Changes needed if you want to upgrade
- Refresh call no longer required, is now optional
- Customer data is completely synced both ways with backend and persisted on device.
- Full implementation of geofences
- New trigger types support
- Geofenced location mode is now Selective Location Mode and can be configured in the backend using triggers
and actions

#### 1.4.1 (25-May-2016)
- Xcode 7.3
- Added full-backgroundmode allow flag for iOS 9

#### 1.3.8 (6-Apr-2016)
- added the getBeaconState method
- SDK footprint: 353k (without sound resources)

#### 1.3.7
- Customized notification sounds with sound resources SDK version 1.3.6
- Fixed: Authorisation enhancement not always asked when within geofence

#### 1.3.5
- Geofenced Location Authorisation mode.
- inBeacon V4 mobile API
- SDK settings adjustable from backend

#### 1.3.4
- bluetooth capability check
- sync bluetooth, notification and location authorisations
- sync SDK mode and validation

#### 1.3.3
- Allow for restricted background mode.
- Use 3 minute backgroundtask for restricted background mode on regin enter and exit
- plist setting verification on app start

#### 1.3.2
- Localnotification logging added

#### 1.3.1
- Serverdata validation. Numeric, boolean and null values can now be send as string as well.
- Title bar layout for webview based actions with titlebar option
- refresh regions after user changes Authorisation status
- Log info about the number of monitored regions
- leaving a region also leaves proximity and location
- utf8 encoding for HMAC secret

#### 1.3.0
- inBeacon v3 mobile API
- Allow for more than 20 locations
- auto-refresh on region enter

#### 1.2.0
- Enhanced beacon proximity and averaging filters ●

#### 1.1.0
- Background execution bugs fixed
- iOS 8 locationmanager bugs workarounds

#### 1.0.4
- ios 8 update

#### 1.0.3
- initial release candidate
