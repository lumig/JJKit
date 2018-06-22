
Pod::Spec.new do |s|
  s.name         = "JJKit"
  s.version      = "1.0"
  s.summary      = "一个基础工具库"
  s.homepage     = "https://github.com/lumig/JJKit"
  s.license      = "MIT"
  s.author       = { "lumig" => "lumic@sina.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/lumig/JJKit.git", :tag => "#{s.version}" }
  s.source_files  = "JJKit/JJKit/*.{h,m}"
  s.requires_arc = true
  # s.exclude_files = "Classes/Exclude"
  #s.dependency 'AFNetworking'
  s.dependency 'YYKit'

end