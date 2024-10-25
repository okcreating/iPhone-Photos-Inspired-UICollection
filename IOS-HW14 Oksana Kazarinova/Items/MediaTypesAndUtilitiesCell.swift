//
//  MediaTypesAndUtilitiesCell.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 10/06/2024.
//

import UIKit

class MediaTypesAndUtilitiesCell: UICollectionViewListCell {
    static let identifier = "MediaTypesAndUtilitiesCell"

   // MARK: Outlets

   lazy var icon: UIImageView = {
       let imageView = UIImageView()
       imageView.clipsToBounds = true
       imageView.contentMode = .scaleAspectFit
       return imageView
   }()

   lazy var albumName: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
       label.textColor = .systemBlue
       return label
   }()

   lazy var amountOfPhotoLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
       label.textColor = .gray
       return label
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
       contentView.addSubview(amountOfPhotoLabel)
   }

   private func setupLayout() {
       icon.snp.makeConstraints { make in
           make.leading.equalTo(self).offset(10)
           make.top.bottom.equalTo(self)
       }

      albumName.snp.makeConstraints { make in
          make.leading.equalTo(contentView).offset(45)
          make.top.bottom.equalTo(contentView)
       }

       amountOfPhotoLabel.snp.makeConstraints { make in
           make.trailing.equalTo(contentView).offset(-10)
           make.top.bottom.equalTo(contentView)
       }
   }

   // MARK: Configuration

   func configuration(model: CompositionalModel) {
//       var content = defaultContentConfiguration()
//       content.image = UIImage(systemName: model.image ?? "blank")
//       content.text = model.mainTitle
//       contentConfiguration = content
//       accessories = [.disclosureIndicator()]

       self.icon.image = UIImage(systemName: model.image ?? "blank")
       self.albumName.text = model.mainTitle
       self.amountOfPhotoLabel.text = String("\(model.numberOfItems ?? 0)")
   }

   // MARK: Reuse

   override func prepareForReuse() {
       super.prepareForReuse()
       self.icon.image = nil
       self.albumName.text = nil
       self.amountOfPhotoLabel.text = nil
   }
}
