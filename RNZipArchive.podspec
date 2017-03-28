require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|

  s.name           = 'RNZipArchive'
  s.version        = package['version']
  s.summary        = package['description']
  s.author         = package['author']
  s.license        = package['license']
  s.homepage       = 'https://github.com/mockingbot/react-native-zip-archive'
  s.source         = { :git => 'https://github.com/mockingbot/react-native-zip-archive.git', :tag => "#{s.version}"}
  s.platform       = :ios, '8.0'
  s.preserve_paths = '*.js'
  s.library        = 'z'

  s.dependency 'React'

  s.subspec 'Core' do |ss|
    ss.source_files = 'ios/*.{h,m}'
    ss.public_header_files = ['ios/RNZipArchive.h']
  end

  s.subspec 'RNSSZipArchive' do |ss|
    ss.source_files = 'ios/RNSSZipArchive/*.{h,m}', 'ios/RNSSZipArchive/aes/*.{h,c}', 'ios/RNSSZipArchive/minizip/*.{h,c}'
    ss.private_header_files = 'ios/RNSSZipArchive/*.h', 'ios/RNSSZipArchive/aes/*.h', 'ios/RNSSZipArchive/minizip/*.h'
  end

end
