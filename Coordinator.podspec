Pod::Spec.new do |s|
  s.name         = "Coordinator"
  s.version      = "0.1"
  s.summary      = "This is an example of a cross-platform Swift framework!"
  s.description  = <<-DESC
    Your description here.
  DESC
  s.source       = { :git => "https://github.com/Nang01T2/Coordinator.git.git", :tag => s.version }
  s.homepage     = "https://github.com/Nang01T2/Coordinator.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Nang Nguyen" => "nang.nguyen@evizi.com" }
  s.social_media_url   = ""

  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "3.0"
  s.tvos.deployment_target = "10.0"

  s.source_files  = "Sources/**/*"
  s.resource_bundles = {
    'Coordinator' => [
        'Sources/*.xcassets'
    ]
  }

  #s.dependency 'RxSwift'
end
