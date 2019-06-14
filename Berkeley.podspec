Pod::Spec.new do |s|
  s.name                      = "Berkeley"
  s.version                   = "1.0.0"
  s.summary                   = "Berkeley"
  s.homepage                  = "git@github.com:MoveUpwards/Berkeley.git"
  s.license                   = { :type => "MIT", :file => "LICENSE" }
  s.author                    = { "Move Upwards" => "contact@moveupwards.dev" }
  s.source                    = { :git => "git@github.com:MoveUpwards/Berkeley.git.git", :tag => s.version.to_s }
  s.ios.deployment_target     = "8.0"
  s.tvos.deployment_target    = "9.0"
  s.watchos.deployment_target = "2.0"
  s.osx.deployment_target     = "10.10"
  s.source_files              = "Sources/**/*"
  s.frameworks                = "Foundation"
end
