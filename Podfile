source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/AudioKit/Specs.git'

def shared_pods
  pod 'AudioKit'
  pod 'MusicTheorySwift'
end

target 'MIDISequencer iOS' do
  platform :ios, '11.0'
  shared_pods
end

target 'MIDISequencer Mac' do
  platform :osx, '10.13'
  shared_pods
end
