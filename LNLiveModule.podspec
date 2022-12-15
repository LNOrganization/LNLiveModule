#
# Be sure to run `pod lib lint LNLiveModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LNLiveModule'
  s.version          = '0.1.0'
  s.summary          = 'A short description of LNLiveModule.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/NoNameOrganazation/LNLiveModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dongjianxiong' => 'jianxiong20090919@126.com' }
  s.source           = { :git => 'https://github.com/NoNameOrganazation/LNLiveModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'LNLiveModule/Classes/**/*'
  s.public_header_files = 'LNLiveModule/Classes/*.h'
  
  s.subspec 'Network' do |network|
    network.source_files = 'LNLiveModule/Classes/Network/**/*'
    network.public_header_files = 'LNLiveModule/Classes/Network/*.h'
  end
  
  s.subspec 'Base' do |base|
    base.source_files = 'LNLiveModule/Classes/Base/**/*'
    base.public_header_files = 'LNLiveModule/Classes/Base/*.h'
    # 自有subspec
    base.dependency 'LNLiveModule/Network'
    # 公有库
    base.dependency 'MJRefresh'
    base.dependency 'SDWebImage'
    base.dependency 'AFNetworking'
    
  end
  
  s.subspec 'Feature' do |feature|
    feature.source_files = 'LNLiveModule/Classes/Feature/**/*.{h,m}'
    feature.public_header_files = 'LNLiveModule/Classes/Feature/**/*.h'
    feature.resource_bundles = {
      'LNLiveModule' => ['LNLiveModule/Classes/Feature/**/*.xib', 'LNLiveModule/Classes/**/*.{png,jpg,jpeg}']
    }
    feature.dependency 'LNLiveModule/Base'
  end
  
  s.subspec 'Mediator' do |mediator|
    mediator.source_files = 'LNLiveModule/Classes/Mediator/**/*'
    mediator.dependency 'LNLiveModule/Feature'
  end
  
  s.dependency 'LNModuleProtocol'
  s.dependency 'LNCommonKit'
  
  
  # s.resource_bundles = {
  #   'LNLiveModule' => ['LNLiveModule/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
