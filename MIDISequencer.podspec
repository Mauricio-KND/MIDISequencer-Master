#
#  Be sure to run `pod spec lint MIDISequencer.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "MIDISequencer"
  s.version      = "0.0.6"
  s.summary      = "MIDI Sequencer that sends MIDI events to other apps."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
MIDISequencer
===

MIDI Sequencer that sends MIDI events to other apps.
Built top on AKSequencer of AudioKit for iOS and macOS.
Create smart MIDI sequencer instruments with just focus on notes.

Requirements
----

- Swift 3.0+
- iOS 9.0+
- macOS 10.11+

Install
----

``` ruby
pod 'MIDISequencer'
```

Usage
----

MIDISequencer built top on `AudioKit`'s `AKSequencer` with [`MusicTheory`](https://github.com/cemolcay/MusicTheory) library to create sequences just focusing on notes with multiple track support.

- Create a `MIDISequencer` instance.

``` swift
let sequencer = MIDISequencer(name: "Awesome Sequencer")
```

- Create a `MIDISequencerTrack` and add it to sequencer's tracks.

``` swift
let track = MIDISequencerTrack(
name: "Track 1",
midiChannel: 1)
```

- Add some `MIDISequencerStep`s to track's `steps`

``` swift
track.steps = [
MIDISequencerStep(
note: Note(type: .c, octave: 4),
noteValue: NoteValue(type: .quarter),
velocity: .standard(100)),
MIDISequencerStep(
note: Note(type: .d, octave: 4),
noteValue: NoteValue(type: .quarter),
velocity: .standard(100)),
MIDISequencerStep(
note: Note(type: .e, octave: 4),
noteValue: NoteValue(type: .quarter),
velocity: .standard(100)),
MIDISequencerStep(
note: Note(type: .f, octave: 4),
noteValue: NoteValue(type: .quarter),
velocity: .standard(100)),
]
```

- You can even add chords or multiple notes or even both to any step.

```
MIDISequencerStep(
chord: Chord(type: .maj, key: .c),
octave: 4,
noteValue: NoteValue(type: .quarter),
velocity: .standard(60))

MIDISequencerStep(
notes: [Note(type: .c, octave: 4), Note(type: .d, octave: 4)],
octave: 4,
noteValue: NoteValue(type: .quarter),
velocity: .standard(60))

MIDISequencerStep(
notes: Chord(type: .maj, key: .c).notes(octave: 4) + [Note(type: .c, octave: 4), Note(type: .d, octave: 4)],
noteValue: NoteValue(type: .quarter),
velocity: .standard(60))
```

- Set `isMuted` property to `true` to mute any `MIDISequencerStep`.
                   DESC

  s.homepage     = "https://github.com/AudioKit/MIDISequencer"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "cemolcay" => "ccemolcay@gmail.com" }
  # Or just: s.author    = "cemolcay"
  # s.authors            = { "cemolcay" => "ccemolcay@gmail.com" }
  # s.social_media_url   = "http://twitter.com/cemolcay"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  # s.platform     = :ios, "5.0"

  #  When using multiple platforms
  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.11"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/AudioKit/MIDISequencer.git", :tag => "#{s.version}" }
  # { :path => "." }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "Source/*.swift"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency "MusicTheorySwift"
  s.dependency "AudioKit"

end
