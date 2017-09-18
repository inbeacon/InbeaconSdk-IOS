//
//  ViewController.m
//  objc-example
//
//  Created by rvw on 8-7-16.
//  Copyright © 2016 inBeacon. All rights reserved.
//

#import "ViewController.h"
@import InbeaconSdk;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *email;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    InbeaconSdk *inbeacon=[InbeaconSdk getInstance];
    
    // EXAMPLE: show username and email properties
    self.username.text= [inbeacon userStringForKey: @"name"];
    self.email.text=  [inbeacon userStringForKey: @"email"];
    
    // EXAMPLE: how to handle an app-event (as defined in the campaign designer)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotification:) name:@"inb:AppEvent" object:nil];
    
    // EXAMPLE: how to handle a userinfochange-event, monitoring user properties and tags
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onUserInfoChange:) name:@"inb:userinfo" object:nil];
}
- (IBAction)saveClicked:(id)sender {
    InbeaconSdk *inbeacon=InbeaconSdk.sharedInstance;
    [self.view endEditing:YES];
    // EXAMPLE: update username and email properties and sync this with backend
    [inbeacon setUserString: self.username.text forKey: @"name"];
    [inbeacon setUserString: self.email.text forKey: @"email"];
}
- (IBAction)syncClicked:(id)sender {
    // EXAMPLE: force synchronisation with backend (normally done automatically at certain interval)
    [InbeaconSdk.sharedInstance refreshWithForce:true];
}

-(void)onNotification:(NSNotification*)notification {
    // EXAMPLE: Show incoming notifications (like app-event)
    NSLog(@"Notification: name=%@ userinfo=%@\n", [notification name], [notification userInfo]);
}

-(void)onUserInfoChange:(NSNotification*)notification {
    InbeaconSdk *inbeacon=InbeaconSdk.sharedInstance;
    // EXAMPLE: react on changing userinfo by updating the on-screen values
    NSLog(@"Received userinfo change" );
    NSDictionary *changed=[notification userInfo];
    NSString *key=[changed objectForKey:@"key"];
    if (key) {
        if ([key isEqualToString: @"name"]) {
            self.username.text=[inbeacon userStringForKey: @"name"];
        }
        if ([key isEqualToString: @"email"]) {
            self.email.text=[inbeacon userStringForKey: @"email"];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
