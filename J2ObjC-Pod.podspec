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
  s.version          = '1.1.0'
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
  s.preserve_paths = 'dist/lib', 'dist/include', 'dist/j2objc', 'dist/j2objcc'

  s.prepare_command = <<-CMD
    Scripts/download.sh
  CMD

  s.default_subspec = 'lib/jre'

  s.source_files = 'dist/include/**/*.h'
  s.public_header_files = 'dist/include/**/*.h'
  s.header_mappings_dir = 'dist/include'

  s.subspec 'lib' do |lib|
    lib.frameworks = 'Security'
    lib.osx.frameworks = 'ExceptionHandling'
    lib.xcconfig = {
      'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/J2ObjC-Pod/dist/include"'
    }

    # lib.subspec 'all' do |all|
    #   all.dependency 'J2ObjC-Pod/lib/jre'
    #   all.dependency 'J2ObjC-Pod/lib/jsr305'
    #   all.dependency 'J2ObjC-Pod/lib/guava'
    #   all.dependency 'J2ObjC-Pod/lib/javax_inject'
    #   all.dependency 'J2ObjC-Pod/lib/xalan'
    #   all.dependency 'J2ObjC-Pod/protobuf_runtime'
    # end

    lib.subspec 'jre' do |jre|
      jre.libraries = 'z', 'icucore'
      jre.vendored_libraries = 'dist/lib/libjre_emul.a'
    end

    # lib.subspec 'jsr305' do |jsr305|
    #   jsr305.dependency 'J2ObjC-Pod/lib/jre'
    #   jsr305.vendored_libraries = 'dist/lib/libjsr305.a'
    # end

    # lib.subspec 'junit' do |junit|
    #   junit.dependency 'J2ObjC-Pod/lib/jre'
    #   junit.vendored_libraries = 'dist/lib/libjunit.a', 'dist/lib/libmockito.a'
    # end

    # lib.subspec 'guava' do |guava|
    #   guava.dependency 'J2ObjC-Pod/lib/jre'
    #   guava.vendored_libraries = 'dist/lib/libguava.a'
    # end

    # lib.subspec 'javax_inject' do |javax_inject|
    #   javax_inject.dependency 'J2ObjC-Pod/lib/jre'
    #   javax_inject.vendored_libraries = 'dist/lib/libjavax_inject.a'
    # end

    # lib.subspec 'xalan' do |xalan|
    #   xalan.dependency 'J2ObjC-Pod/lib/jre'
    #   xalan.vendored_libraries = 'dist/lib/libxalan.a'
    # end

    # lib.subspec 'protobuf_runtime' do |protobuf_runtime|
    #   protobuf_runtime.vendored_libraries = 'dist/lib/libprotobuf_runtime.a'
    # end
  end
end
