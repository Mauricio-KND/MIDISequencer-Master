//
//  MIDISequencerArpeggiator.swift
//  MIDISequencer
//
//  Created by Cem Olcay on 16/09/2017.
//
//

import Foundation
import MusicTheorySwift

/// `MIDISequencerArpeggiator`'s arpeggio style.
public enum MIDISequencerArpeggio: Int, Codable {
  /// Arpeggiates notes from start to end.
  case up
  /// Arpeggiates notes from end to start.
  case down
  /// Arpeggiates note from start to end and arpeggiates again from end to start.
  case updown
  /// Arpeggiates notes in random order.
  case random
}

/// Arpeggiator with arpeggio style and notes that will be arpeggiated.
public struct MIDISequencerArpeggiator: Codable {
  /// Notes will be arpeggiated.
  public var notes: [Key]
  /// Arpeggio style.
  public var arpeggio: MIDISequencerArpeggio
  /// Octave range of arpeggiator.
  public var octaves: [Int]

  /// Initilizes arpeggiator with same note in octave range with arpeggio style.
  ///
  /// - Parameters:
  ///   - note: Notes will be arpeggiated.
  ///   - arpeggio: Arpeggio style.
  ///   - octaves: Octave range of notes.
  public init(note: Key, arpeggio: MIDISequencerArpeggio, octaves: [Int]) {
    self.notes = [note]
    self.arpeggio = arpeggio
    self.octaves = octaves
  }

  /// Initilizes arpeggiator with notes in octave range with arpeggio style.
  ///
  /// - Parameters:
  ///   - note: Notes will be arpeggiated.
  ///   - arpeggio: Arpeggio style.
  ///   - octaves: Octave range of notes.
  public init(notes: [Key], arpeggio: MIDISequencerArpeggio, octaves: [Int]) {
    self.notes = notes
    self.arpeggio = arpeggio
    self.octaves = octaves
  }

  /// Initilizes arpeggiator with notes in scale with their octave range and arpeggio style.
  ///
  /// - Parameters:
  ///   - scale: Notes in scale will be arpeggiated.
  ///   - arpeggio: Arpeggio style.
  ///   - octaves: Octave range of notes.
  public init(scale: Scale, arpeggio: MIDISequencerArpeggio, octaves: [Int]) {
    self.notes = scale.keys
    self.arpeggio = arpeggio
    self.octaves = octaves
  }

  /// Initilizes arpeggiator with notes in chord with their octave range and arpeggio style.
  ///
  /// - Parameters:
  ///   - chord: Notes in chord will be arpeggiated.
  ///   - arpeggio: Arpeggio style.
  ///   - octaves: Octave range of notes.
  public init(chord: Chord, arpeggio: MIDISequencerArpeggio, octaves: [Int]) {
    self.notes = chord.keys
    self.arpeggio = arpeggio
    self.octaves = octaves
  }

  /// Generates `MIDISequencerStep`s from notes in arpeggio style order with note values and velocities.
  ///
  /// - Parameters:
  ///   - position: Position in track, in form of beats, to start placing steps from.
  ///   - duration: Duration of each step, in form of beats.
  ///   - velocity: Velocities of each note in arpeggiator.
  /// - Returns: `MIDISequencerStep`s from arpeggiator.
  public func steps(position: Double, duration: Double, velocity: MIDISequencerVelocity) -> [MIDISequencerStep] {
    var stepNotes = [MIDISequencerStep]()
    var currentPosition = position
    for octave in octaves {
      for type in notes {
        stepNotes.append(MIDISequencerStep(
          note: Pitch(key: type, octave: octave),
          position: currentPosition,
          duration: duration,
          velocity: velocity))
        currentPosition += duration
      }
    }

    switch arpeggio {
    case .up:
      return stepNotes
    case .down:
      return stepNotes.reversed()
    case .updown:
      return stepNotes + stepNotes.reversed()
    case .random:
      if stepNotes.count < 2 { return stepNotes }

      for i in stepNotes.startIndex ..< stepNotes.endIndex - 1 {
        let j = Int(arc4random_uniform(UInt32(stepNotes.endIndex - i))) + i
        if i != j {
          stepNotes.swapAt(i, j)
        }
      }

      return stepNotes
    }
  }
}
