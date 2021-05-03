// Created by Manuel Lopez on 4/21/21.

import UIKit

enum MoonState: String, CaseIterable {
  case new
  case waxingCrescent
  case firstQuarter
  case waxingGibbous
  case full
  case waningGibbous
  case lastQuarter
  case waningCrescent
  case error

  init?(currentMoonDay: Double) {
    switch currentMoonDay {
      case 0...1:
        self = .new
      case 1...6.38264692644:
        self = .waxingCrescent
      case 6.38264692644...8.38264692644:
        self = .firstQuarter
      case 8.38264692644...13.76529385288:
        self = .waxingGibbous
      case 13.76529385288...15.76529385288:
        self = .full
      case 15.76529385288...21.14794077932:
        self = .waningGibbous
      case 21.14794077932...23.14794077932:
        self = .lastQuarter
      case 23.14794077932...28.53058770576:
        self = .waningCrescent
      case 28.53058770576...29.53058770576:
        self = .new
      default:
        self = .error
    }
  }
}

class MoonPhase {
  // MARK: Properties

  let state: MoonState
  var phaseOfMoonLabel = String()
  var moonEmojiLabel = String()

  let moonEmoji = EnumMap<MoonState, String> { type in
    switch type {
    case .new:
      return  "🌑"
    case .waxingCrescent:
      return  "🌒"
    case .firstQuarter:
      return "🌓"
    case .waxingGibbous:
      return  "🌔"
    case .full:
      return  "🌕"
    case .waningGibbous:
      return  "🌖"
    case .lastQuarter:
      return  "🌗"
    case .waningCrescent:
      return  "🌘"
    case .error:
      return "error"
    }
  }

  let dateNow: Date

  // The duration in days of a lunar cycle
  let lunarDays: Double = 29.53058770576

  // Seconds in lunar cycle
  let lunarSeconds: Double = 2551442.777777664

  var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd H:m:s"
    return dateFormatter
  }()

  // Date time of first new moon in year 2000
  let newMoon2000: Date

  let totalSeconds: TimeInterval

  var currentSeconds: Double

  let currentFraction: Double

  let currentDays: Double

  // MARK: Methods


  // MARK: Initializer

  init(date: Date) {
    dateNow = date
//    lunarDays = 29.53058770576
//    lunarSeconds = lunarDays * (24 * 60 * 60)
//    dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "yyyy-MM-dd H:m:s"
    newMoon2000 = dateFormatter.date(from: "2000-01-06 18:14:00")!
    totalSeconds = dateNow.timeIntervalSince(newMoon2000)
    currentSeconds = fmod(totalSeconds, lunarSeconds)

    if currentSeconds < 0 {
      currentSeconds += lunarSeconds
    }

    currentFraction = currentSeconds / lunarSeconds
    currentDays = currentFraction * lunarDays


    state = MoonState.init(currentMoonDay: currentDays)!

    phaseOfMoonLabel = state.rawValue
    moonEmojiLabel = moonEmoji[state]

  }
}


struct EnumMap<Enum: CaseIterable & Hashable, Value> {
  private let values: [Enum: Value]

  init(resolver: (Enum) -> Value) {
    var values = [Enum: Value]()

    for key in Enum.allCases {
      values[key] = resolver(key)
    }

    self.values = values
  }

  subscript(key: Enum) -> Value {
    // Here we have to force-unwrap, since there's no way
    // of telling the compiler that a value will always exist
    // for any given key. However, since it's kept private
    // it should be fine - and we can always add tests to
    // make sure things stay safe.
    // https://www.swiftbysundell.com/articles/enum-iterations-in-swift-42/
    return values[key]!
  }
}
