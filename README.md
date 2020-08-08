MIDISequencer
===

MIDI Sequencer that sends MIDI events to other apps.  
Built top on [`AKSequencer`](https://github.com/AudioKit/AudioKit/blob/master/AudioKit/Common/MIDI/Sequencer/AKSequencer.swift) of [AudioKit](https://github.com/AudioKit/AudioKit) for iOS and macOS.  
Create smart MIDI sequencer instruments with just focus on notes.

Requirements
----

- Swift 5.0+
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
sequencer.tracks.append(track)
```

- Set tempo and time signature

``` swift
sequencer.tempo = Tempo(
  timeSignature: TimeSignature(
    beats: 4,
    noteValue: .quarter),
  bpm: 80)
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
sequencer.addTrack(track: track1)
```

- You can even add chords or multiple notes or even both to any step.

``` swift
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

- Create arpeggiated steps with any notes from chords, scales in any octave range with `MIDISequencerArpeggiator`.

``` swift
let arpeggiator = MIDISequencerArpeggiator(
  scale: Scale(type: .blues, key: .a),
  arpeggio: .random,
  octaves: [4, 5])

let melody = MIDISequencerTrack(
  name: "Melody",
  midiChannel: 3,
  steps: arpeggiator.steps(noteValue: NoteValue(type: .quarter), velocity: .random(min: 80, max: 120)))

sequencer.addTrack(track: melody)
```

- Set `isMuted` property to `true` to mute any `MIDISequencerStep`.

- Call one of `play()` or `playAsync()` functions to play sequance.

``` swift
state = .loading
sequancer.playAsync(completion: {
	self.state = .playing
})
```

- Call `stop()` to stop playing.

``` swift
sequencer.stop()
```

Documentation
----

See full [documentation](https://audiokit.io/MIDISequencer)

AppStore
----

This library used in my app [ChordBud](https://itunes.apple.com/us/app/chordbud-chord-progressions/id1313017378?mt=8), check it out!
  
[![alt tag](https://linkmaker.itunes.apple.com/assets/shared/badges/en-us/appstore-lrg.svg)](https://itunes.apple.com/us/app/chordbud-chord-progressions/id1313017378?mt=8)

