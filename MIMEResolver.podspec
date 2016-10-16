Pod::Spec.new do |s|
s.name = 'MIMEResolver'
s.version = '0.0.1'
s.license = 'MIT'
s.summary = 'Micro framework for resolving MIME from Data objects.'
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
