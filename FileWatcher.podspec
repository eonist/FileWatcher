#
#  Be sure to run `pod spec lint FileWatcher.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "FileWatcher"
  spec.version      = "0.2.1"
  spec.summary      = "A library for monitoring file and folder changes in macOS."
  spec.homepage     = "https://github.com/eonist/FileWatcher"
  spec.license      = "MIT"
  spec.author       = { "eonist" => "30n1st@gmail.com" }
  spec.platform     = :osx, "10.12"
  spec.source       = { :git => "https://github.com/eonist/FileWatcher.git", :tag => "#{spec.version}" }
  spec.source_files  = ".", "**/*.{h,m,swift}"
  spec.exclude_files = ["FileWatcherExample", "Exclude"]
  spec.public_header_files = "**/*.h"
  spec.swift_version = "4.0"
end
