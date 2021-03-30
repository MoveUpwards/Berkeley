Pod::Spec.new do |s|
  s.name                      = "Berkeley"
  s.version                   = "1.2.0"
  s.summary                   = "Berkeley"
  s.homepage                  = "https://github.com/MoveUpwards/Berkeley.git"
  s.license                   = { :type => "MIT", :file => "LICENSE" }
  s.author                    = { "Move Upwards" => "contact@moveupwards.dev" }
  s.source                    = { :git => "https://github.com/MoveUpwards/Berkeley.git", :tag => s.version.to_s }
  s.swift_version             = '5.0'
  s.ios.deployment_target     = "10.0"
  s.osx.deployment_target     = "10.13"
  s.source_files              = "Sources/**/*"
  s.frameworks                = "Foundation"

  s.dependency 'SwiftNIO'
  s.dependency 'SwiftNIOTransportServices'
end
