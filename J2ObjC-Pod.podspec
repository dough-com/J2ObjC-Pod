#
# Be sure to run `pod lib lint J2ObjC-Pod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

class Pod::SpecHelper; end

Pod::Spec.new do |s|
  s.name             = 'J2ObjC-Pod'
  s.version          = '2.2'
  s.summary          = 'Integrates the pre-built J2ObjC frameworks into your project.'
  s.description      = <<-DESC
  Downloads the J2ObjC v1.1 release and integrates the frameworks into your project.
                       DESC

  s.homepage         = 'https://github.com/dough-com/J2ObjC-Pod'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dough' => 'developers@dough.com' }
  s.source           = { :git => 'https://github.com/dough-com/J2ObjC-Pod.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.requires_arc = true


  s.prepare_command = <<-CMD
    Scripts/download.sh
  CMD


  # s.public_header_files = 'dist/include/**/*.h'
  s.header_mappings_dir = 'dist/include'
  s.preserve_paths = 'dist'

end
