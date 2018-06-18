Pod::Spec.new do |s|
  s.name         = "JJKit"
  s.version      = "1.0"
  s.summary      = "一个实用的工具"
  s.homepage     = "https://github.com/lumig"
  s.license      = "MIT"
  s.author       = { "lumig" => "lumic@sina.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/lumig/JJKit.git", :tag => "#{s.version}" }
  s.source_files  = "JJKit/JJKit/**/*.{h,m}"
  s.requires_arc = true
  # s.exclude_files = "Classes/Exclude"
  s.dependency 'AFNetworking'
  # s.dependency 'RealReachability'
  # s.dependency 'YYKit'


end