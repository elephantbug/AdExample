source 'https://github.com/CocoaPods/Specs.git'
platform :ios, :deployment_target => '14.0'

target 'AdExample' do
  pod 'YandexMobileAdsMediation', '7.5.1'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
    end
  end
end
