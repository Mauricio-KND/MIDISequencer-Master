//
//  MIDISequencerStep.swift
//  MIDISequencer
//
//  Created by Cem Olcay on 12/09/2017.
//
//

import Foundation
import MusicTheorySwift

/// A step in a `MIDISequencerTrack` of `MIDISequencer`.
public struct MIDISequencerStep: Codable {
  /// Notes in step.
  public var notes: [Pitch]
  /// Position in track, in form of beats. 0.25 is first bar's second beat, 1.50 is second bar's third beat.
  public var position: Double
  /// Duration of step, in form of beats. 1.0 is a whole beat, 0.25 is a quarter beat.
  public var duration: Double
  /// Velocity if each notes in step.
  public var velocity: MIDISequencerVelocity

  /// Initilizes the step with multiple notes.
  ///
  /// - Parameters:
  ///   - notes: Notes in step.
  ///   - position: Position in track, in form of beats.
  ///   - duration: Duration of step, in form of beats.
  ///   - velocity: Velocity of each note in step.
  public init(notes: [Pitch], position: Double, duration: Double, velocity: MIDISequencerVelocity) {
    self.notes = notes
    self.position = position
    self.duration = duration
    self.velocity = velocity
  }

  /// Initilizes the step with single note.
  ///
  /// - Parameters:
  ///   - note: Note in step.
  ///   - position: Position in track, in form of beats.
  ///   - duration: Duration of step, in form of beats.
  ///   - velocity: Velocity of note in step.
  public init(note: Pitch, position: Double, duration: Double, velocity: MIDISequencerVelocity) {
    self.init(notes: [note], position: position, duration: duration, velocity: velocity)
  }

  /// Initilizes the step with a chord in desired octave.
  ///
  /// - Parameters:
  ///   - chord: Desierd chord in step.
  ///   - octave: Octave of chord in step.
  ///   - position: Position in track, in form of beats.
  ///   - duration: Duration of step, in form of beats.
  ///   - velocity: Velocity of chord in step.
  public init(chord: Chord, octave: Int, position: Double, duration: Double, velocity: MIDISequencerVelocity) {
    self.init(notes: chord.pitches(octave: octave), position: position, duration: duration, velocity: velocity)
  }

  /// Creates an empty, muted step.
  ///
  /// - Parameters:
  ///   - position: Position in track, in form of beats.
  ///   - duration: Duration of step, in form of beats.
  public init(position: Double, duration: Double) {
    self.init(notes: [], position: position, duration: duration, velocity: .muted)
  }
}
