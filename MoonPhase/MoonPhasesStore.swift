// Created by Manuel Lopez on 4/26/21.
// Copyright © 2021 Airbnb Inc. All rights reserved.

import UIKit

public class MoonPhasesStore {
  private(set) var allMoonPhases = [MoonPhase]()
  var dates = [Date]()

  init() {
    dates = createDates()
    for date in dates {
      let moonPhase = MoonPhase(date: date)
      allMoonPhases.append(moonPhase)
    }
  }

  func createDates() -> [Date] {
    var dates = [Date]()
    let dateToday = Date()
    let dateYesterday = Date().addingTimeInterval(-86400)
    let dateBeforeYesterday = Date().addingTimeInterval(-172800)
    let dateTomorrow = Date().addingTimeInterval(86400)
    let dateAfterTomorrow = Date().addingTimeInterval(172800)
    dates.append(contentsOf: [dateBeforeYesterday, dateYesterday, dateToday, dateTomorrow, dateAfterTomorrow])

    return dates

  }
}
