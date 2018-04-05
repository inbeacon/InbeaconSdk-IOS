### Compile error dyld: Library not loaded
`Compile error dyld: Library not loaded: @rpath/libswiftCore.dylib Reason: image not found`
##### Solutions:
- Set "always embed swift standard libraries" flag to YES in build settings
- Make sure you are using the correct version of the SDK that matches the XCode version

### Logging error NSLocationAlwaysUsageDescription not defined in plist
`🔴🔴 SDK: ##########  ###### Error: NSLocationAlwaysUsageDescription not defined in plist`
##### Solution:
- include the NSLocationAlwaysUsageDescription Value in your plist for iBeacon interactions

### Runtime error dyld: Library not loaded:
`dyld: Library not loaded: @rpath/InbeaconSdk.framework/InbeaconSdk Reason: image not found`
##### Solution:
- Include the framework in the “embedded libraries” section of the General tab of the target

### Link error: ld: warning: ignoring file 
`ld: warning: ignoring ..../InbeaconSdk.framework/InbeaconSdk, missing required architecture x86_64 in file /Users/rvw/proj/iPhoneapps/xcodeProjects/test/inbeaconSDKv2testobjc/InbeaconSdk.framework/InbeaconSdk (2 slices)
Undefined symbols for architecture x86_64:
  "_OBJC_CLASS_$__TtC11InbeaconSdk11InbeaconSdk", referenced from:
      objc-class-ref in AppDelegate.o
ld: symbol(s) not found for architecture x86_64`
##### Solution:
- You used the iphoneOS version of the framework for a simulator environment. Use the “universal” version of the framework. The iphoneOS version only contains the arm7 and arm64 architectures. 

### App crash 
`App crash 0x100149a10 <+3120>: brk    #0x1  EXC_BREAKPOINT`
##### Solution:
Make sure there are no “invisible” characters like unicode  zero-width-space in the client-ID or client-secret.
This can be the result from copy-pasting from PDF documents etc.

---
If you are running into problems while integrating the SDK you can always create a ticket using the help button at the bottom of the screen in the inbeacon backend (console.inbeacon.nl) or email to [support@inbeacon.nl](mailto:support@inbeacon.nl)

`Previous:` [Simple example, minimal setup](example-code.md)