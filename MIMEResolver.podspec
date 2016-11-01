Pod::Spec.new do |s|
s.name = 'MIMEResolver'
s.version = '0.0.2'
s.license = 'MIT'
s.summary = 'µ framework for resolving MIME type from Data objects'
s.homepage = 'https://github.com/inloop/MIMEResolver'
s.authors = { 'Jakub Petrik' => 'petrik@inloop.eu' }
s.source = { :git => 'https://github.com/inloop/MIMEResolver.git', :tag => s.version }

s.ios.deployment_target = '10.0'
s.osx.deployment_target = '10.11'
s.watchos.deployment_target = '3.0'
s.tvos.deployment_target = '10.0'

s.source_files = 'Sources/*.{h,swift}'
s.frameworks = 'Foundation'

end

