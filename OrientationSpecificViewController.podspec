#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "OrientationSpecificViewController"
  s.version      = "0.1.0"
  s.summary      = "Allows you to display separate nibs for both landscape and portrait"
  s.license      = 'MIT'
  s.author       = { "Vinayak Badrinathan" => "vinnybad@gmail.com" }
  s.source       = { :git => "git@github.com:vinnybad/OrientationSpecificViewController.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Assets'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  s.frameworks = 'Foundation', 'UIKit'
end
