## Using files from the github repository

- Universal `InbeaconSdk.framework` : everything included for working with the inBeacon API Architectures in the inBeaconSdk framework are: i386 x86_64 armv7 arm64

- `bitcoded_framwork/InbeaconSdk.framework` : stripped version with only armv7 and arm64 for use with bitcode

- Resources directory with notification sounds to be copied into your app bundle

## Steps

### Add the framework to your project

Drag the framework to your project and make sure the framework is embedded, as it is a dynamic framework. Dragging it from your project list to the "embedded binaries" chapter is sufficient as this automatically adds it to the linked-framework-and-libraries chapter

  ![image alt text](image_9.png)

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


    

## Bundle resources for customized notification sounds

Customized sounds are available for local notifications. In order to use customized notification sounds, copy all files in the *./resources* directory of the SDK to your application bundle. You could do this by drag/dropping these into your "copy bundle resources" section of the Build Phases of your app:

![image alt text](image_12.png)

Customized sounds can be selected in the campaign action of the inBeacon backend console.



## Extra build options for objective-c projects 

  The inBeacon SDK is a dynamic swift framework, and for objective-C projects, you need to set the "Always embed swift standard libraries" 

  ![image alt text](image_17.png)


`Previous:` [Installing the SDK](installing-the-sdk.md)   `Next:` [Using the SDK](using-the-sdk.md)
