Pod::Spec.new do |s|
  s.name             = 'SSLNavigationBar'
  s.version          = '0.1.0'
  s.summary          = 'This is a simple custom NavigationBar written in Swift.'

  s.description      = <<-DESC
	SSLNavigationBar is a simple custom NavigationBar written in Swift. The function is same as SLNavigationBar.
                       DESC

  s.homepage         = 'https://github.com/smilelu/SSLNavigationBar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'smilelu' => 'mhilyt@foxmail.com' }
  s.source           = { :git => 'https://github.com/smilelu/SSLNavigationBar.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'SSLNavigationBar/**/*.swift'
  
  s.resource_bundles = {
     'SSLNavigationBar' => ['Resources/*.png']
  }

  s.frameworks = 'UIKit'
  s.dependency 'SnapKit'
  
end
