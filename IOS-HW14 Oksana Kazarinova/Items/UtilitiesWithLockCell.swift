//
//  UtilitiesWithLockCell.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 10/06/2024.
//

import UIKit

class UtilitiesWithLockCell: UICollectionViewListCell {
    static let identifier = "UtilitiesWithLockCell"

   // MARK: Outlets

   lazy var icon: UIImageView = {
       let imageView = UIImageView()
       imageView.clipsToBounds = true
       imageView.contentMode = .scaleAspectFit
       return imageView
   }()

   lazy var albumName: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
       label.textColor = .systemBlue
       return label
   }()

   lazy var lockIcon: UIImageView = {
       let icon = UIImageView(image: UIImage(systemName: "lock.fill"))
       icon.tintColor = .gray
       return icon
   }()

   // MARK: Initializers

   override init(frame: CGRect) {
       super.init(frame: frame)
       setupHierarchy()
       setupLayout()
   }

   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

   // MARK: Setups

   private func setupHierarchy() {
       contentView.addSubview(icon)
       contentView.addSubview(albumName)
       contentView.addSubview(lockIcon)
   }

   private func setupLayout() {
       icon.snp.makeConstraints { make in
           make.leading.equalTo(self)
           make.top.bottom.equalTo(self)
       }

      albumName.snp.makeConstraints { make in
          make.leading.equalTo(icon).offset(15)
          make.top.bottom.equalTo(contentView)
       }

       lockIcon.snp.makeConstraints { make in
           make.trailing.equalTo(contentView).offset(-10)
           make.top.bottom.equalTo(contentView)       }
   }

   // MARK: Configuration

   func configuration(model: CompositionalModel) {
       self.icon.image = UIImage(named: model.image ?? "blank")
       self.albumName.text = model.mainTitle
   }

   // MARK: Reuse

   override func prepareForReuse() {
       super.prepareForReuse()
       self.icon.image = nil
       self.albumName.text = nil
   }
}
