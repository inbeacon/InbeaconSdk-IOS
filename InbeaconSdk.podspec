Pod::Spec.new do |s|
  s.name         		= "Ccpipo"
  s.version     		= "0.0.5"
  s.summary      		= "Pipo framework for iOS (Obj-C & Swift)"
  s.homepage    		= "https://github.com/rvwoens/ccpipo"
  # s.screenshots  		= ""

  s.license      		= { :type => "MIT", :file => "LICENSE.md" }
  s.author       		= "Rvwoens"
  # s.social_media_url   	= "http://twitter.com/woenz"
  s.platform     		= :ios
  s.ios.deployment_target = '8.0'
  s.source       		= { :git => "https://github.com/rvwoens/ccpipo.git", :tag => s.version.to_s } 
  
  s.frameworks   = 'UIKit', 'QuartzCore', 'CoreGraphics'

  s.source_files = '*.swift'

end
