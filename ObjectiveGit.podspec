Pod::Spec.new do |spec|
  spec.name = "ObjectiveGit"
  spec.version = "0.1"
  spec.summary = "Objective-C bindings to libgit2."
  spec.homepage = "https://github.com/libgit2/objective-git"
  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.authors = {
    "Tim Clem" => "timothy.clem@gmail.com",
    "Josh Abernathy" => "josh@github.com"
  }
  spec.source = {
    :git => "https://github.com/libgit2/objective-git.git",
    :tag => spec.version.to_s,
    :submodules => true
  }
  spec.source_files = "Classes/**/*.{h,m}",
  spec.osx.libraries = "ssl", "crypto", "z"
  spec.ios.libraries = "z"
  spec.requires_arc = true
  spec.platforms = {
    :ios => "5.0",
    :osx => "10.6"
  }
  spec.dependency "libgit2", "0.18.0beta0"
  spec.ios.xcconfig = {
    "OTHER_LDFLAGS" => "-all_load"
  }
  spec.prefix_header_contents = "#define GTLog(fmt, ...) NSLog((@\"%s [Line %d] \" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);",
  spec.description = "    Objective Git provides Objective-C bindings to the libgit2 linkable C Git library.\n    This library follows the rugged API as close as possible while trying to maintain a native objective-c feel.\n"
end
