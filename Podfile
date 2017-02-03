# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

PROJECT_NAME = 'FizzBuzzTDDSwift'
TEST_EG_TARGET = 'FizzBuzzTDDSwiftEGTests'
SCHEME_FILE = 'FizzBuzzTDDSwiftEGTests.xcscheme'

target 'FizzBuzzTDDSwift' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FizzBuzzTDDSwift

  target 'FizzBuzzTDDSwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'FizzBuzzTDDSwiftUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  target TEST_EG_TARGET do
    project PROJECT_NAME

    use_frameworks!
    inherit! :search_paths
    pod 'EarlGrey'
  end
  

  target 'FizzBuzzTDDSwiftKIFTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'KIF', '~> 3.0'
	pod 'KIF/IdentifierTests'
  end

end

post_install do |installer|
  require 'earlgrey'
  configure_for_earlgrey(installer, PROJECT_NAME, TEST_EG_TARGET, SCHEME_FILE,{swift: true})
end
