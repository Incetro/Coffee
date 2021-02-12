inhibit_all_warnings!

source 'https://cdn.cocoapods.org/'

platform :ios, '11.0'

target 'Venue' do
  use_frameworks!
  pod "SwiftLint"
  pod "SwiftyBeaver"
  pod "MBProgressHUD"
  pod "Message"
  pod "Sentry", :git => "https://github.com/getsentry/sentry-cocoa.git", :tag => "5.1.9"
  pod "swift-layout"
  pod "Swinject"
  pod "SwinjectAutoregistration"
  pod "AppCenter"
  pod "DeviceKit"
  pod "Alamofire", "~> 4.9.1"
  pod "Kingfisher"
  pod "RealmSwift"
  pod "HTTPTransport"
  pod "ObjectMapper"
  pod 'InputMask'
end

post_install do |installer|
  # This removes the warning about swift conversion, hopefuly forever!
  installer.pods_project.root_object.attributes['LastSwiftMigration'] = 9999
  installer.pods_project.root_object.attributes['LastSwiftUpdateCheck'] = 9999
  installer.pods_project.root_object.attributes['LastUpgradeCheck'] = 9999
  installer.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
      end
    end
    installer.pods_project.build_configurations.each do |config|
        config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
