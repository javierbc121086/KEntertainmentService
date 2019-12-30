platform :ios, '9.0'

source 'https://github.com/CocoaPods/Specs.git' 
source 'git@gitlab.com:GonetGrupo/iOS/Dependencies/Spects/GNNetworkServicesSpec.git'
source 'git@gitlab.com:GonetGrupo/iOS/Dependencies/Spects/GNSwissRazorSpec.git'
source 'git@github.com:javierbc121086/KEntertainmentDomainSpec.git'

target 'KEntertainmentService' do
  use_frameworks!

  pod 'GNNetworkServices'
  pod 'GNSwissRazor'
  pod 'KEntertainmentDomain'

  target 'KEntertainmentServiceTests' do

    pod 'GNNetworkServices'
    pod 'GNSwissRazor'
    pod 'KEntertainmentDomain'
  end

end
