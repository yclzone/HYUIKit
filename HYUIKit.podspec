#
# Be sure to run `pod lib lint HYUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "HYUIKit"
  s.version          = "0.4.0"
  s.summary          = "HYUIKit is a categories set of UIView, UITableView, UICollectionView, UITextField, UITextView."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC

HYUIKit is a categories set of UIView, UITableView, UICollectionView, UITextField, UITextView. It make UIKit more easy to use by using less code.
                       DESC

  s.homepage         = "https://github.com/yclzone/HYUIKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "yclzone" => "yclzone@gmail.com" }
  s.source           = { :git => "https://github.com/yclzone/HYUIKit.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/yclzone'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'HYUIKit' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
