// Created by Manuel Lopez on 4/15/21.

import UIKit

class MoonPhaseViewController: UIViewController {

  // MARK: Properties
  let moonPhasesStore: MoonPhasesStore
  let collectionView: UICollectionView

  init(store: MoonPhasesStore) {
    moonPhasesStore = store
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
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(MoonPhaseViewCell.self, forCellWithReuseIdentifier: MoonPhaseViewCell.cellReuseID)

    collectionView.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.1254901961, alpha: 1)
  }

}

extension MoonPhaseViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return moonPhasesStore.allMoonPhases.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoonPhaseViewCell.cellReuseID, for: indexPath) as! MoonPhaseViewCell

    let moonPhase = moonPhasesStore.allMoonPhases[indexPath.row]
    cell.configure(moonPhase: moonPhase)
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }

}
