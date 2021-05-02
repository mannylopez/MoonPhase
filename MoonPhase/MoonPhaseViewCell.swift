// Created by Manuel Lopez on 4/25/21.

import UIKit

class MoonPhaseViewCell: UICollectionViewCell {

  // MARK: Properties
  static var cellReuseID: String { "MoonPhaseViewCell" }

  let moonPhaseLabel: UILabel = {
    let moonPhaseLabel = UILabel(frame: .zero)
    moonPhaseLabel.textColor = .white
    moonPhaseLabel.textAlignment = .center
    return moonPhaseLabel
  }()

  let emojiLabel: UILabel = {
    let emojiLabel = UILabel(frame: .zero)
    emojiLabel.textAlignment = .center
    return emojiLabel
  }()

  let moonDayLabel: UILabel = {
    let moonDayLabel = UILabel(frame: .zero)
    moonDayLabel.textColor = .black
    moonDayLabel.textAlignment = .center
    moonDayLabel.textColor = .white
    return moonDayLabel
  }()

  // MARK: - INITIALIZER
  override init(frame: CGRect) {
    super.init(frame: frame)

    let margins = layoutMarginsGuide

    contentView.addSubview(moonPhaseLabel)
    moonPhaseLabel.translatesAutoresizingMaskIntoConstraints = false
    moonPhaseLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
    moonPhaseLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    moonPhaseLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true

    contentView.addSubview(emojiLabel)
    emojiLabel.translatesAutoresizingMaskIntoConstraints = false
    emojiLabel.topAnchor.constraint(equalTo: moonPhaseLabel.bottomAnchor).isActive = true
    emojiLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    emojiLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    emojiLabel.bottomAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true

    contentView.addSubview(moonDayLabel)
    moonDayLabel.translatesAutoresizingMaskIntoConstraints = false
    moonDayLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor).isActive = true
    moonDayLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    moonDayLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    moonDayLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(moonPhase: MoonPhase) {
    moonPhaseLabel.text = moonPhase.phaseOfMoonLabel
    emojiLabel.text = moonPhase.moonEmojiLabel
    moonDayLabel.text = String(moonPhase.currentDays)
  }
}
