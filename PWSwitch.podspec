#
# Be sure to run `pod lib lint PWSwitch.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PWSwitch'
  s.version          = '1.1.3'
  s.summary          = 'Highly customizable UISwitch built with CALayers and CAAnimations'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Custom UISwitch implementation designed for those who want more control over the looks of the component. Built with CALayers and CAAnimations for finer control and nice interaction visual effects.
                       DESC

  s.homepage         = 'https://github.com/Shaninnik/PWSwitch'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nikita Shanin' => 'shaninnik@gmail.com' }
  s.source           = { :git => 'https://github.com/Shaninnik/PWSwitch.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/NikitaShanin'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PWSwitch/**/*.swift'
  
  # s.resource_bundles = {
  #   'PWSwitch' => ['PWSwitch/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
