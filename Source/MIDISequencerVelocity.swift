//
//  MIDISequencerVelocity.swift
//  MIDISequencer iOS
//
//  Created by Cem Olcay on 20.11.2017.
//

import Foundation

/// Velocity of notes in a step.
public enum MIDISequencerVelocity: Codable, ExpressibleByIntegerLiteral {
  /// Static velocity that not changed.
  case standard(Int)
  /// Maximum velociy which is 127.
  case max
  /// Zero velocity.
  case muted
  /// Random velocity between min and max values that changed in every loop.
  case random(min: Int, max: Int)

  /// Initilize velocity. No random type possible.
  ///
  /// - Parameter velocity: Velocity value.
  public init(velocity: Int) {
    if velocity <= 0 {
      self = .muted
    } else if velocity >= 127 {
      self = .max
    } else {
      self = .standard(velocity)
    }
  }

  /// Returns the velocity value.
  public var velocity: Int {
    switch self {
    case .standard(let velocity):
      return velocity
    case .max:
      return 127
    case .muted:
      return 0
    case .random(let min, let max):
      return Int(arc4random_uniform(UInt32(max - min))) + min
    }
  }

  // MARK: ExpressibleByIntegerLiteral

  /// Integer literal type is `Int`.
  public typealias IntegerLiteralType = Int

  /// Initilizes with a direct integer value.
  ///
  /// - Parameter value: Integer value for the velocity.
  public init(integerLiteral value: MIDISequencerVelocity.IntegerLiteralType) {
    self = MIDISequencerVelocity(velocity: value)
  }

  // MARK: Codable

  /// Keys that conforms CodingKeys protocol to map properties.
  private enum CodingKeys: String, CodingKey {
    /// Velocity value of `MIDISequencerStepVelocity`.
    case velocity
  }

  /// Decodes struct with a decoder.
  ///
  /// - Parameter decoder: Decodes encoded struct.
  /// - Throws: Tries to initlize struct with a decoder.
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let velocity = try values.decode(Int.self, forKey: .velocity)
    self = MIDISequencerVelocity(velocity: velocity)
  }

  /// Encodes struct with an ecoder.
  ///
  /// - Parameter encoder: Encodes struct.
  /// - Throws: Tries to encode struct.
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(velocity, forKey: .velocity)
  }
}
