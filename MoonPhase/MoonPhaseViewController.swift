// Created by Manuel Lopez on 4/15/21.
// Copyright © 2021 Airbnb Inc. All rights reserved.

import UIKit

class MoonPhaseViewController: UIViewController {

  let moonPhase: MoonPhase

  init() {
    moonPhase = MoonPhase()

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    print(moonPhase.currentDays)
  }


}

