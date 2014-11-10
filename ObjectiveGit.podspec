Pod::Spec.new do |s|
  s.name          = "ObjectiveGit"
  s.version       = "0.2.004"
  s.summary       = "Objective-C bindings to libgit2."
  s.description   = <<-DESC
    Objective Git provides Objective-C bindings to the libgit2 linkable C Git
    library. This library follows the rugged API as close as possible while
    trying to maintain a native objective-c feel.

    _This version of the Podspec is unstable. Experimenting with various options to get it to build correctly._
  
    Podspec maintained by Ben Chatelain <benchatelain@gmail.com>.
  DESC
  s.homepage      = "https://github.com/libgit2/objective-git"
  s.license       = { :type => "MIT", :file => "LICENSE" }
  s.authors       = {
    "Tim Clem" => "timothy.clem@gmail.com",
    "Josh Abernathy" => "josh@github.com",
    "Ben Chatelain (spec)" => "benchatelain@gmail.com"
  }

  s.source        = {
    :git => "https://github.com/libgit2/objective-git.git",
    :commit => "ec53c3e",
    :submodules => false
  }
  s.source_files  = 'Classes/**/*.{h,m}'

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  s.osx.libraries = %w|ssl crypto z|
  s.ios.libraries = %w|z|
  s.requires_arc  = true
  s.ios.xcconfig  = {
    "OTHER_CFLAGS" => "-v", # For debugging #include
    "OTHER_LDFLAGS" => "-all_load"
  }
  s.prefix_header_contents = '#define GTLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);'

  s.dependency 'libgit2', '0.21.2'
end
