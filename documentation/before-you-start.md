## Considerations for integration

### Permissions

When the SDK is integrated into an app, the app will request some permissions.  If the app already needed those permissions before integration of the SDK,  these permissions will not be requested again. These permissions are requested once after installation when the app is started (and the inBeacon SDK is initialized).

##### Application would like to send you notifications

![image alt text](image_1.png)

##### Application would like to access your location even when you are not using the app.

![image alt text](https://github.com/inbeacon/InbeaconSdk-IOS/blob/master/documentation/image_2.png)

It is also possible to run the SDK in "Selective Location Authorisation" mode (SDK 1.3.5 and up). In this case the SDK asks for “when in use” access only, and asks for “even when you are not using the app” mode at the moment the campaign action “ask background location-scanning permission” is triggered. (see below)

##### When bluetooth is turned off:

![image alt text](https://github.com/inbeacon/InbeaconSdk-IOS/blob/master/documentation/image_3.png)

> After running a few days, the user gets a notification that the app is looking for beacons or geofences (even when no beacons or geofences are actually found). We found out that this message is always given in combination with message 2), and is not related to the actual location or iBeacon features used in the app.

> ![image alt text](https://github.com/inbeacon/InbeaconSdk-IOS/blob/master/documentation/image_4.png)

When the SDK is running in  "Selective Location Authorisation" mode, this message is not send until after the user was asked to add background scanning.

### Background mode

There are three fundamentally different ways to run the inBeacon SDK:

#### Restricted background mode

This means that if a user is moving around within a (beacon) region more than 3 minutes after entering the region, triggers will no longer work when the app is in the background.

Advantages:
- App submission to the app store is without issues about background location scanning
Extra Battery power use is limited to a minimum

Disadvantages:
- This limits the app to a maximum of 3 minutes beacon ranging after the app enters a beacon region.

#### Full background mode
For iOS, full background mode requires extra location background settings so the app is able to run continuously  in the background during iBeacon ranging.

Advantages:
- When users approach an iBeacon in Near or Immediate proximity, all inBeacon triggers and other functionality is fully supported. During the complete stay of the user in the iBeacon location, the app will monitor the range to all defined iBeacons.

Disadvantages:
- the app description in the app-store needs to include the following: "Note: Continued use of GPS and <app name> running in the background can dramatically decrease battery life. <app name> will automatically shut down if you run it in the background and leave <description of location where ibeacons are used>."
- Possibility of initial app rejection by iTunes connect (apple appstore). However in the past we were able to get all apps approved, even with full background mode ON.
-  The app uses a bit more battery power when inside beacon regions. Because location monitoring is set for least-accurate, GPS is not used by the SDK. We found that the decrease of battery life is negligible.


>iTunes application notes

>Because we use iBeacon ranging in the background  you need to include a note in your app description:

> - "Continued use of GPS running in the background can dramatically decrease battery life."

> We were able to get applications approved with the following text:
in English:
Note: Continued use of GPS and [app name] running in the background can dramatically decrease battery life. [app name] will automatically shut down if you run it in the background and leave [description of location where ibeacons are used]

> in Dutch:
Opmerking: Langdurig gebruik van GPS en [app naam] kan de levensduur van de accu drastisch verminderen. [app naam] zal automatisch afsluiten zodra u [omschrijving van de locatie waar de ibeacons worden gebruikt] verlaat.

#### Selective Location Authorisation mode

(special cases only)
In this mode the app starts by only asking for "when in use" location permissions. The app will ask for full (background) location permission only after the defined “ask bg permission” action is triggered from the campaign manager.. Selective Location Authorisation is defined on the inBeacon backend.
You can for instance ask for permission when the user activates the app within a Geofence.


Advantages:
- all advantages of restricted background mode
- only ask full permissions to a specific subset of your users

Disadvantages
- Only a subset of your users will be able to detect beacons
- all disadvantages of restricted background mode

>Important: Please note that permissions will only be asked once. If an enduser decides to decline the permission and the trigger fires for the second time, iOS will not ask the permission again.


Using full, restricted background mode or Selective Location Autorisation mode depends on your specific situation.

### Memory footprint

SDK without sound resources: 494kB

with sound resources: 1.07MB

### App store submission

#### Store submission rejections

In case of a rejection when using FULL BACKGROUND mode, we’ve used this plea successfully in the past:

>This app using the inBeacon SDK is rejected because it uses background mode to detect beacon ranging events in the background (detect near/immediate proximities)  Other apps using the same inBeacon SDK also have background mode on, and were approved without any problems.

>The problem:

>We use iBeacons in several stores and we want to give the most relevant information to our customers. This means that we don't want to show the dreaded "welcome to our store" notification on region entrance, because that is not relevant to the customer at that moment.

>Instead we want to give notifications when a customer is interested in specific areas of the store, for instance where an article with a discount is presented, or to present a "use your loyalty card" notification at the checkout. This way we can enhance the customer journey and start interacting at the right place in the store.

>We use this system for a number of months now and with good results.

>Why do we need background mode to do this?

>We can detect the iBeacon region entrance and exit with the CLBeaconRegion method, however this will give us only events when the user enters/leaves our store.

>So we need to start ranging in the background at the moment the iBeacon region (store) is entered and that is not possible without using a background service. otherwise our app would go to sleep after mere seconds after entering the beacon region and it will not be able to detect near or immediate proximity.

>Do we use a lot of extra battery life?

>We think not. If the app is outside the iBeacon region (our store), we stop our background process, so the ranging is only done inside the iBeacon region. And this is bluetooth low-energy technology, so it is relatively battery-friendly compared to GPS background mode.

>Is near/immediate ranging less accurate when people have their iPhone in their pockets?

>We think not. We have done excessive testing the last 6 months with hundreds of customers. Also we've added additional averaging algorithms in our code to make sure the events on the near and immediate ranges are more solid than ever.

>Conclusion: We think the background ranging for near and immediate proximity is a valid technique to enhance the customer journey and allows for a more userfriendly experience.

>So please reconsider the rejection.

`Previous:` [Home](https://github.com/inbeacon/InbeaconSdk-IOS/blob/master/documentation/README.md) `Next:` [Installing the SDK](Installing-the-SDK)
