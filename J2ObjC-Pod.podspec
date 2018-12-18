Pod::Spec.new do |s|
  s.name             = 'J2ObjC-Pod'
  s.version          = '2.0.5'
  s.summary          = 'Integrates the pre-built J2ObjC frameworks into your project.'
  s.description      = <<-DESC
  Downloads the j2objc release and integrates the frameworks into your project.
                       DESC

  s.homepage         = 'https://github.com/Corey-Pett/j2objc-pod'
  s.license          = 'private'
  s.author           = { 'Corey-Pett' => 'coreyallenpett@gmail.com' }
  s.source           = { :git => 'https://github.com/tastyworks/j2objc-pod.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.requires_arc = false

  s.prepare_command = <<-CMD
    scripts/download.sh
  CMD

  s.preserve_paths = 'dist/**/*'
  s.public_header_files = 'dist/include/**/*.h'
  s.source_files = 'dist/include/**/*.h'
  s.header_mappings_dir = 'dist/include'

  s.libraries = 'jre_emul', 'icucore', 'z', 'iconv'
  s.vendored_libraries = 'dist/lib/libjre_emul.a', 'dist/lib/libjavax_inject.a'

  s.xcconfig = { 
      'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/J2Objc/dist/include"'
   }

end