Pod::Spec.new do |s|
  s.name         		= "InbeaconSdk"
  s.version     		= "2.0.1c"
  s.summary      		= "Inbeacon SDK framework for iOS (Obj-C & Swift)"
  s.homepage    		= "https://github.com/inbeacon/InbeaconSdk-IOS"
  # s.screenshots  		= ""
  s.author       		= "inBeacon"
  s.platform     		= :ios
  s.ios.deployment_target 	= '8.0'
  s.source       		= { :git => "https://github.com/inbeacon/InbeaconSdk-IOS.git", :tag => s.version.to_s } 
  
  s.vendored_frameworks = 'InbeaconSdk.framework'
  s.frameworks   = 'UIKit', 'Foundation', 'SystemConfiguration', 'MobileCoreServices', 'CoreLocation', 'CoreBluetooth'
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2016 Inbeacon b.v. All rights reserved.
      LICENSE
  }

end
