Pod::Spec.new do |s|
  s.name = 'WhereYat'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = "Where y'at IP-based geolocation"
  s.homepage = 'https://github.com/WhereYat/whereyat-swift'
  s.social_media_url = 'http://twitter.com/zaneshannon'
  s.authors = { 'Zane Shannon' => 'zane@zaneshannon.com' }
  s.source = { :git => 'https://github.com/WhereYat/whereyat-swift.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'WhereYat.swift'

  s.requires_arc = true
end