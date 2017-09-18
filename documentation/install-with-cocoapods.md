# Steps
Using [CocoaPods](https://cocoapods.org/pods/InbeaconSdk), a few application settings must be configured for correct integration of the SDK:

## Add the inbeacon SDK to your podfile
  To get the latest version of the InbeaconSdk from cocoapods, add this to your Podfile 
  > Xcode 9 from version 2.2 upwards, so use '~> 2.2'
  
  > xcode 8 version 2.1.x, so use '~> 2.1' 
  
  > Xcode 7 use '~> 2.0'

  ```ruby
  pod 'InbeaconSdk', '~> 2.2'
  ```
  Also make sure the "use_frameworks!" flag is supplied. A sample Podsfile:

  ```ruby
  platform :ios, '9.0'

  target 'CocoapodTest' do

         	use_frameworks!

         	pod 'InbeaconSdk', '~> 2.2'

  end
  ```
  After this run ‘pod install’ and you’re good to go.
  

## Add descriptions for use of Location



  >Note:
  >Without these, the app never asks for permission to use location and inBeacon won’t function !
  
  Add text items to the custom target info.
  
  ![image alt text](image_5.png)

  Add: **NSLocationAlwaysUsageDescription**   

  Text that is shown under the permission dialog when asked for "even when you are not using the app" location permission (this is the default permission needed to use the inBeacon SDK)

  Add: **NSBluetoothPeripheralUsageDescription**
  
  Text that is shown under the permission dialog for accessing Bluetooth peripherals. Note that this dialog is *never* shown by the SDK, as it is only used to determine whether bluetooth turned ON or OFF. But on app submission, this item is mandatory. You can use a standard text: "to check your bluetooth status"
  
  Optionally add: **NSLocationWhenInUseUsageDescription**  
  
  >IMPORTANT:
  >If your app calls *request​When​In​Use​Authorization()* itself, please change this into *requestAlwaysAuthorization()* as this might interfere with the request from the SDK.

  Text that is shown under the permission dialog when asked for "while using the app in the foreground". This is only necessary when using the 2-step “Selective Location Authorisation” mode.

  ![image alt text](image_6.png)
  


## Extra build options for objective-c projects 

  The inBeacon SDK is a dynamic swift framework, and for objective-C projects, you need to set the "Always embed swift standard libraries" (xCode 8) or "embedded content contains swift code" (xCode 7) flag to "Yes"

  ![image alt text](image_17.png)
  ![image alt text](image_8.png)


## Full background mode (optional)
  > WARNING: Only when using full-background mode. Using this mode can lead to app-rejection by Apple when submitted to the appstore. Special use cases only.

  If you choose to run your app in full background mode you will need to add location update background mode to your info.plist / application settings:

  Turn background Mode on for Location updates. This allows ranging of beacon proximities in the background at any time, and removes the 3 minutes limit on ranging after entering a region.

  ![image alt text](image_7.png)

  >Do NOT turn background mode ON when operating in Restricted-background-mode or Geofenced Location Authorisation mode.  Use this only when running the app in full-background mode for proximity ranging purposes.

`Previous:` [Installing the SDK](installing-the-sdk.md)   `Next:` [Using the SDK](using-the-sdk.md)