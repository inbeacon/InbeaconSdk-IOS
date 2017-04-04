## Using files from the github repository

- Universal `InbeaconSdk.framework` : everything included for working with the inBeacon API Architectures in the inBeaconSdk framework are: i386 x86_64 armv7 arm64

- `bitcoded_framwork/InbeaconSdk.framework` : stripped version with only armv7 and arm64 for use with bitcode

- Resources directory with notification sounds to be copied into your app bundle

## Steps

### Add the framework to your project

Drag the framework to your project and make sure the framework is embedded, as it is a dynamic framework. Dragging it from your project list to the "embedded binaries" chapter is sufficient as this automatically adds it to the linked-framework-and-libraries chapter

  ![image alt text](image_9.png)

### Add descriptions for use of Location
>Without this description, the app never asks for permission to use location and inBeacon won’t function!

![image alt text](image_10.png)

Add: `NSLocationAlwaysUsageDescription`   

Text that is shown under the permission dialog when asked for "even when you are not using the app" location permission (this is the default permission needed to use the inBeacon SDK)

Add: `NSBluetoothPeripheralUsageDescription`
  
  Text that is shown under the permission dialog for accessing Bluetooth peripherals. Note that this dialog is *never* shown by the SDK, as it is only used to determine whether bluetooth turned ON or OFF. But on app submission, this item is mandatory. You can use a standard text: "to check your bluetooth status"

Optionally, add: `NSLocationWhenInUseUsageDescription`

  >IMPORTANT:
  >If your app calls *request​When​In​Use​Authorization()* itself, please change this into *requestAlwaysAuthorization()* as this might interfere with the request from the SDK.


Text that is shown under the permission dialog when asked for "while using the app in the foreground". This is only necessary when using the 2-step “Selective Location Authorisation” mode.

![image alt text](image_11.png)

## Bundle resources for customized notification sounds

Customized sounds are available for local notifications. In order to use customized notification sounds, copy all files in the *./resources* directory of the SDK to your application bundle. You could do this by drag/dropping these into your "copy bundle resources" section of the Build Phases of your app:

![image alt text](image_12.png)

Customized sounds can be selected in the campaign action of the inBeacon backend console.

## Full background mode for location updates 
>*Only when using full-background mode*

To switch the SDK into full background mode, turn background Mode on for Location updates. This allows ranging of beacon proximities in the background at any time, and removes the 3 minutes limit on ranging after entering a region.

  ![image alt text](image_13.png)

>Do NOT turn background mode ON when operating in Restricted-background-mode or Geofenced Location Authorisation mode. Use this only when running the app in full-background mode for proximity ranging purposes.


## Extra build options for objective-c projects 

  The inBeacon SDK is a dynamic swift framework, and for objective-C projects, you need to set the "Always embed swift standard libraries" (xCode 8) or "embedded content contains swift code" (xCode 7) flag to "Yes"

  ![image alt text](image_17.png)
  ![image alt text](image_8.png)

`Previous:` [Installing the SDK](installing-the-sdk.md)   `Next:` [Using the SDK](using-the-sdk.md)
