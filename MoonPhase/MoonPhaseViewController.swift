// Created by Manuel Lopez on 4/15/21.
// Copyright © 2021 Airbnb Inc. All rights reserved.

import UIKit

class MoonPhaseViewController: UIViewController {

  // MARK: Properties
  let moonPhase: MoonPhase
  let collectionView: UICollectionView

  init() {
    moonPhase = MoonPhase()
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    super.loadView()

    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    collectionView.backgroundColor = .red
    print(moonPhase.currentDays)
  }


}

