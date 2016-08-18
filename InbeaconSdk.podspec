Pod::Spec.new do |s|
  s.name         		= "Ccpipo"
  s.version     		= "0.0.5"
  s.summary      		= "Pipo framework for iOS (Obj-C & Swift)"
  s.homepage    		= "https://github.com/rvwoens/ccpipo"
  # s.screenshots  		= ""
  s.author       		= "Rvwoens"
  # s.social_media_url   	= "http://twitter.com/woenz"
  s.platform     		= :ios
  s.ios.deployment_target = '8.0'
  s.source       		= { :git => "https://github.com/rvwoens/ccpipo.git", :tag => s.version.to_s } 
  
  s.vendored_frameworks = 'InbeaconSdk.framework'
  s.frameworks   = 'UIKit', 'Foundation', 'SystemConfiguration', 'MobileCoreServices', 'CoreLocation', 'CoreBluetooth'
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2016 Inbeacon b.v. All rights reserved.
      LICENSE
  }

end
