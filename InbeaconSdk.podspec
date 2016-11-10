Pod::Spec.new do |s|
  s.name         		= "InbeaconSdk"
  s.version     		= "2.1.9"
  s.summary      		= "Inbeacon SDK framework for iOS (Obj-C & Swift)"
  s.homepage    		= "https://github.com/inbeacon/InbeaconSdk-IOS"
  s.author       		= { 'Ronald van Woensel' => 'ronald@inbeacon.nl' }
  s.platform     		= :ios
  s.ios.deployment_target 	= '9.3'
  s.source       		= { :git => "https://github.com/inbeacon/InbeaconSdk-IOS.git", :tag => s.version.to_s } 
  s.documentation_url 		= 'https://github.com/inbeacon/InbeaconSdk-IOS'

  s.vendored_frameworks = 'InbeaconSdk.framework'
  s.resources 	  	= 'resources/*'

  s.frameworks   = 'UIKit', 'Foundation', 'SystemConfiguration', 'MobileCoreServices', 'CoreLocation', 'CoreBluetooth'
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2016 Inbeacon b.v. All rights reserved.
      LICENSE
  }

end
