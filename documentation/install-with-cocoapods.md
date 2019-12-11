# Steps
Using [CocoaPods](https://cocoapods.org/pods/InbeaconSdk), a few application settings must be configured for correct integration of the SDK:

## Add the Resono SDK to your podfile
Subsequent swift versions are not backwards or upwards compatible, so you will always need to obtain an SDK version that fits your swift version. The SDK is normally released days after an official GA of xCode, so if you are using the latest xCode version, you should probably use the latest version of the SDK as well.

To get the latest version of the Resono SDK from cocoapods, add this to your Podfile 
>Note:
>The SDK is called InbeaconSdk, not ResonoSdk for historical reasons.

  ```ruby
  pod 'InbeaconSdk', '~> 3.0'
  ```
  Also make sure the "use_frameworks!" flag is supplied. A sample Podsfile:

  ```ruby
  platform :ios, '10.0'

  target 'CocoapodTest' do

         	use_frameworks!

         	pod 'InbeaconSdk', '~> 3.0'

  end
  ```
  After this run ‘pod install’ and you’re good to go.
  
## Add descriptions for use of Location 

  >Note:
  >Without these, the app never asks for permission to use location and inBeacon won’t function !
  
  Add 4 Privacy - text items to the custom target info.
  
  ![image alt text](image_18.png)

  Add: **Privacy - Location Always Usage Description**  (**NSLocationAlwaysUsageDescription**) 

  Text that is shown under the permission dialog when asked for "even when you are not using the app" location permission (this is a permission needed to use the inBeacon SDK)

  Add: **Privacy - Location Always and When In Use Usage Description**   

  Text that is shown under the permission dialog when asked for "even when you are not using the app" location permission with the option of allowing when-in-use. (this is a permission needed to use the inBeacon SDK)
  
![image alt text](image_19.png)
  
  add: **Privacy - Location When in Use Usage Description**  (**NSLocationWhenInUseUsageDescription**)

  Text that is shown under the permission dialog when asked for "while using the app in the foreground". This is only necessary when using the 2-step “Selective Location Authorisation” mode.   


## Extra build options for objective-c projects 

  The inBeacon SDK is a dynamic swift framework, and for objective-C projects, you need to set the "Always embed swift standard libraries" 
  
  ![image alt text](image_17.png)



`Previous:` [Installing the SDK](installing-the-sdk.md)   `Next:` [Using the SDK](using-the-sdk.md)