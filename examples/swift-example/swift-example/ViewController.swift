//
//  ViewController.swift
//  swift-test
//
//  Created by rvw on 22-3-2016.
//  Copyright © 2016 inBeacon. All rights reserved.
//

import UIKit
import InbeaconSdk
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameEdit: UITextField!
    @IBOutlet weak var emailEdit: UITextField!
    
    var locationManager: CLLocationManager? = nil
    
    // EXAMPLE: Working with persisted and synchronized backend user data
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Optional: Request Authorization for using location.
        // You might ask for AlwaysAuthorization or start of with requestWhenInUseAuthorization
        // The InbeaconSDK will always ask for AlwaysAuthorization later (when askPermissions is true)
        // locationManager = CLLocationManager()
        // locationManager?.requestAlwaysAuthorization()   // Optional.
        
        // initialize with existing (persisted) userinfo
        usernameEdit.text = InbeaconSdk.sharedInstance.user["name"] ?? ""
        emailEdit.text =  InbeaconSdk.sharedInstance.user["email"] ?? ""
        
        // When userinfo is updated (from the backend) we will update the visible fields
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(userInfoUpdated(_:)),
            name: NSNotification.Name(rawValue: "inb:userinfo"),
            object: nil)

    }
    @IBAction func saveClick(_ sender: AnyObject) {
        
        // this will persist the new values locally and will sync the backend
        // if you remove the app and reinstall the values will be restored from the server.
        InbeaconSdk.sharedInstance.user["name"] = usernameEdit.text
        InbeaconSdk.sharedInstance.user["email"] = emailEdit.text
    }
    @IBAction func synchronizeClick(_ sender: AnyObject) {
        
        // This will normally happen automatically but can be done on request
        // If you changed userinfo at inBeacon serverside you will get a notification (inb:userinfo)
        InbeaconSdk.sharedInstance.refresh(true)
        
    }
    
    @IBAction func askPermissionsClick(_ sender: Any) {
        // When askPermissions is set to false before initialization of the SDK
        // it can be set to true anytime later.
        // to test, uncomment the askPermissions = false in the AppDelegate
        InbeaconSdk.sharedInstance.askPermissions = true
    }
    
    // called whenever the serverside updates information
    @objc func userInfoUpdated(_ notification: Notification) {
        guard let userInfo:Dictionary<String,String?> = ((notification as NSNotification).userInfo as NSDictionary? as? Dictionary<String,String?>) else {
            return
        }
        switch (userInfo["key"] ?? "")! as String {
        case "name":
            usernameEdit.text=InbeaconSdk.sharedInstance.user["name"] ?? ""
            print("Got update for name!")
        case "email":
            emailEdit.text =  InbeaconSdk.sharedInstance.user["email"] ?? ""
            print("Got update for email!")
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

