Pod::Spec.new do |s|
  s.name            = 'FoomoClientAPI'
  s.version         = '0.0.2'
  s.summary         = 'Communication b/w Foomo clients and application server.'
  s.homepage        = 'https://github.com/falisd/iOSClientAPIs'
  s.license         = 'MIT'
  s.author          = { 'Hussain Mansoor' => 'hussain_raj1@yahoo.com' }
  s.source          = { :git => 'https://github.com/falisd/iOSClientAPIs.git', :tag => 'v0.0.2' }

# Platform setup
  s.requires_arc    = true
  s.ios.deployment_target = '6.0'

# Dependencies
  
  s.dependency     'GoldenFleeceCustom', :git => 'https://github.com/falisd/gf.git', :tag => 'v1.2.6'

  s.source_files    = 'FoomoClientAPI/**/*.{h,m}', 'FoomoClientAPI/*.{h,m}'

end
