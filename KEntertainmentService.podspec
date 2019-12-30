
Pod::Spec.new do |spec|

  spec.name         = "KEntertainmentService"
  spec.version      = "0.0.1"
  spec.summary      = "Dependencia encargada de contener la definición de los servicios Kavak Entretainment"

  spec.description  = <<-DESC
  Dependencia que contienen los servicios que expone a los desarrolladores que quieran consumir 
  los servicios de Peliculas y Tv de Kavak Entretainment
                   DESC

  spec.homepage     = "https://github.com/javierbc121086/KEntertainmentService"
  spec.license      = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "Javier Bolaños Carapia" => "javier.bc121086@gmail.com" }
  spec.social_media_url   = "https://www.linkedin.com/in/javier-bola%C3%B1os-carapia-47b079152/"


  spec.platform     = :ios
  spec.ios.deployment_target = "9.0"


  spec.source       = { :git => "git@github.com:javierbc121086/KEntertainmentService.git", :tag => "#{spec.version}" }


  spec.source_files  = "KEntertainmentService", "KEntertainmentService/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"


  spec.requires_arc = true
  spec.swift_versions = "5.1.3"

  spec.dependency "GNNetworkServices"
  spec.dependency "GNSwissRazor"
  spec.dependency "KEntertainmentDomain"

end

## Release New Pod ##
# git tag -a 0.0.1 -m "Pod V0.0.1"
# git push --tags
# pod repo push KEntertainmentServiceSpec KEntertainmentService.podspec --allow-warnings --sources='https://github.com/CocoaPods/Specs.git,https://gitlab.com/GonetGrupo/iOS/Dependencies/Spects/GNNetworkServicesSpec.git,https://gitlab.com/GonetGrupo/iOS/Dependencies/Spects/GNSwissRazorSpec.git,git@github.com:javierbc121086/RPEntertainmentDomainSpec.git' --private --verbose
