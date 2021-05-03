// Created by Manuel Lopez on 4/25/21.

import UIKit

class MoonPhaseViewCell: UICollectionViewCell {

  // MARK: Properties
  static var cellReuseID: String { "MoonPhaseViewCell" }

  var stackView: UIStackView

  let dateLabel: UILabel = {
    let moonPhaseLabel = UILabel(frame: .zero)
    moonPhaseLabel.textColor = .white
    moonPhaseLabel.textAlignment = .center
    return moonPhaseLabel
  }()

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
    stackView = UIStackView(arrangedSubviews: [dateLabel, moonPhaseLabel, emojiLabel, moonDayLabel])
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.alignment = .fill


    super.init(frame: frame)

    let margins = layoutMarginsGuide

    contentView.addSubview(stackView)

    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
    stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(moonPhase: MoonPhase) {
    moonPhaseLabel.text = moonPhase.phaseOfMoonLabel
    dateLabel.text = moonPhase.dateFormatter.string(from: moonPhase.dateNow)
    emojiLabel.text = moonPhase.moonEmojiLabel
    moonDayLabel.text = String(moonPhase.currentDays)
  }
}
