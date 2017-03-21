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
