Pod::Spec.new do |spec|
  spec.name         = "CocoaButton"
  spec.version      = "1.0.0"
  spec.summary      = "Interactive UIButton with loading capability."

  spec.homepage     = "https://github.com/edgar-zigis/CocoaButton"
  spec.screenshots  = "https://raw.githubusercontent.com/edgar-zigis/CocoaButton/master/sample.gif"

  spec.license      = { :type => 'MIT', :file => './LICENSE' }

  spec.author       = "Edgar Žigis"

  spec.platform     = :ios
  spec.ios.deployment_target = '11.0'
  spec.swift_version = '5.0'
  
  spec.source       = { :git => "https://github.com/edgar-zigis/CocoaButton.git", :tag => "#{spec.version}" }

  spec.source_files  = "CocoaButton/**/*.{swift}"
end
