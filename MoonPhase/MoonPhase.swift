// Created by Manuel Lopez on 4/21/21.
// Copyright © 2021 Airbnb Inc. All rights reserved.

import Foundation

class MoonPhase {
  // MARK: Properties
  let dateNow: Date

  // The duration in days of a lunar cycle
  let lunarDays: Double

  // Seconds in lunar cycle
  let lunarSeconds: Double

  var dateFormatter: DateFormatter

  // Date time of first new moon in year 2000
  let newMoon2000: Date

  let totalSeconds: TimeInterval

  var currentSeconds: Double

  let currentFraction: Double

  let currentDays: Double

  // MARK: Methods


  // MARK: Initializer

  init() {
    dateNow = Date()
    lunarDays = 29.53058770576
    lunarSeconds =  lunarDays * (24 * 60 * 60)
    dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd H:m:s"
    newMoon2000 = dateFormatter.date(from: "2000-01-06 18:14:00")!
    totalSeconds = dateNow.timeIntervalSince(newMoon2000)
    currentSeconds = fmod(totalSeconds, lunarSeconds)

    if currentSeconds < 0 {
      currentSeconds += lunarSeconds
    }

    currentFraction = currentSeconds / lunarSeconds
    currentDays = currentFraction * lunarDays


  }
}
