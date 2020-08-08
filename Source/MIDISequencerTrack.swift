//
//  MIDISequencerTrack.swift
//  MIDISequencer
//
//  Created by Cem Olcay on 12/09/2017.
//
//

import Foundation

/// Checks equatibility of two optional `MIDISequencerTrack`s.
///
/// - Parameters:
///   - lhs: Left hand side of the equation.
///   - rhs: Right hand side of the equation.
/// - Returns: Bool value of equation.
public func ==(lhs: MIDISequencerTrack?, rhs: MIDISequencerTrack?) -> Bool {
  switch (lhs, rhs) {
  case (.some(let left), .some(let right)):
    return left.id == right.id
  default:
    return false
  }
}

/// Checks equatibility of two  `MIDISequencerTrack`s.
///
/// - Parameters:
///   - lhs: Left hand side of the equation.
///   - rhs: Right hand side of the equation.
/// - Returns: Bool value of equation.
public func ==(lhs: MIDISequencerTrack, rhs: MIDISequencerTrack) -> Bool {
  return lhs.id == rhs.id
}

/// A track that has `MIDISequencerStep`s in `MIDISequencer`.
public class MIDISequencerTrack: Equatable, Codable {
  /// Unique identifier of track.
  public let id: String
  /// Name of track.
  public var name: String
  /// MIDI Channel of track to send notes to.
  public var midiChannels: [Int]
  /// Steps in track.
  public var steps: [MIDISequencerStep]
  /// Mute or unmute track.
  public var isMute: Bool = false
  /// Make other tracks mute if they are not on solo mode.
  public var isSolo: Bool = false

  /// Duration of the track in form of beats.
  public var duration: Double {
    return steps.map({ $0.position + $0.duration }).sorted().last ?? 0
  }

  /// Initilizes the track with name and optional channel and steps properties. You can always change its steps and channel after created it.
  ///
  /// - Parameters:
  ///   - name: Name of track.
  ///   - midiChannel: Channel of track to send notes to. Defaults 0.
  ///   - steps: Steps in track. Defaults empty.
  public init(name: String, midiChannels: [Int] = [0], steps: [MIDISequencerStep] = [], isMute: Bool = false) {
    self.id = UUID().uuidString
    self.name = name
    self.midiChannels = midiChannels
    self.steps = steps
    self.isMute = isMute
  }
}
