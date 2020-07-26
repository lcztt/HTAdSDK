#
# Be sure to run `pod lib lint HTAdSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HTAdSDK'
  s.version          = '0.1.0'
  s.summary          = 'A short description of HTAdSDK.'
  s.homepage         = 'https://github.com/lcztt/HTAdSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lcztt' => '349632213@qq.com' }
  s.source           = { :git => 'https://github.com/lcztt/HTAdSDK.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  
  s.description      = <<-DESC
  TODO: Add long description of the pod here.
  DESC
  
  # s.resource_bundles = {
  #   'HTAdSDK' => ['HTAdSDK/Assets/*.png']
  # }
  
  s.source_files = 'HTAdSDK/Classes/**/*'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  
  s.resources = 'HTAdSDK/Classes/BaiduMobAdSDK/baidumobadsdk.bundle'
  
  s.frameworks = 'UIKit', 'Foundation', 'StoreKit', 'SafariServices', 'MessageUI', 'CoreMedia', 'CoreMotion', 'SystemConfiguration', 'CoreLocation', 'CoreTelephony', 'AVFoundation', 'AdSupport'
  # 百度 sdk
  s.vendored_frameworks = ['HTAdSDK/Classes/BaiduMobAdSDK/BaiduMobAdSDK.framework']
  s.libraries = ['c++']
  
  # 编译出静态库
  s.static_framework  =  true
  
  # xcode 设置
  s.xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC'
  }
  
  # 广点通
  s.dependency 'GDTMobSDK'
  # 穿山甲
  s.dependency 'Bytedance-UnionAD'
  # 友盟
  s.dependency 'UMCCommon'
  
end
