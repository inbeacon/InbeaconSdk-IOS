# Note: do not alter. Generated from template Cocoapods/templates
Pod::Spec.new do |s|
  s.name         		= "InbeaconSdk"
  s.version     		= "3.2.17"
  s.summary      		= "Inbeacon SDK framework for iOS (Obj-C & Swift)"
  s.homepage    		= "https://github.com/inbeacon/InbeaconSdk-IOS"
  s.author       		= { 'Ronald van Woensel' => 'ronald@inbeacon.nl' }
  s.platform     		= :ios
  s.ios.deployment_target 	= '10.0'
  s.source       		= { :git => "https://github.com/inbeacon/InbeaconSdk-IOS.git", :tag => s.version.to_s } 
  s.documentation_url 		= 'https://github.com/inbeacon/InbeaconSdk-IOS'

  s.vendored_frameworks = 'InbeaconSdk.framework'
  s.resources 	  	= 'resources/*'
  # all archs
  # s.pod_target_xcconfig = { 'VALID_ARCHS' => 'arm64 armv7' }
  # but exclude arm64 from simulator
  s.pod_target_xcconfig = {
    	'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  
  s.frameworks   = 'UIKit', 'Foundation', 'SystemConfiguration', 'MobileCoreServices', 'CoreLocation'
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2016 Inbeacon b.v. All rights reserved.
      LICENSE
  }

end
