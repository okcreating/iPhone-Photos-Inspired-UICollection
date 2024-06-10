//
//  PlacesCell.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 10/06/2024.
//

import UIKit

class PlacesCell: UICollectionViewCell {
    static let identifier = "PlacesCell"

   // MARK: Outlets

   lazy var image1: UIImageView = {
       let imageView = UIImageView()
       imageView.clipsToBounds = true
       imageView.layer.cornerRadius = 10
       imageView.contentMode = .scaleToFill
       return imageView
   }()

    lazy var image2: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .center
        return imageView
    }()

    lazy var photosStack: UIStackView =  {
        let stack = UIStackView()
        stack.alignment = .fill
        return stack
    }()

   lazy var albumName: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
       return label
   }()

   lazy var amountOfPhotoLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
       label.textColor = .gray
       return label
   }()

   lazy var nameAndAmountStack: UIStackView = {
       let stack = UIStackView()
       stack.axis = .vertical
       stack.alignment = .leading
       return stack
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
       contentView.addSubview(photosStack)
       contentView.addSubview(nameAndAmountStack)
       photosStack.addSubview(image1)
       photosStack.addSubview(image2)
       nameAndAmountStack.addSubview(albumName)
       nameAndAmountStack.addSubview(amountOfPhotoLabel)
   }

   private func setupLayout() {
       photosStack.snp.makeConstraints { make in
           make.top.leading.trailing.equalToSuperview()
       }

       nameAndAmountStack.snp.makeConstraints { make in
           make.top.equalTo(photosStack.snp.bottom).offset(-10)
           make.leading.bottom.equalToSuperview()
       }

       albumName.snp.makeConstraints { make in
           make.leading.top.equalTo(nameAndAmountStack).offset(10)
       }

       amountOfPhotoLabel.snp.makeConstraints { make in
           make.leading.equalTo(nameAndAmountStack).offset(10)
           make.top.equalTo(albumName.snp.bottom).offset(-5)
       }

       image1.snp.makeConstraints { make in
           make.edges.equalTo(photosStack)
           make.width.height.equalTo(photosStack)
       }

       image2.snp.makeConstraints { make in
           make.centerX.centerY.equalTo(photosStack)
           make.width.lessThanOrEqualTo(photosStack.frame.width / 2.05)
           make.height.lessThanOrEqualTo(photosStack.frame.height / 2.05)
       }
   }

   // MARK: Configuration

   func configuration(model: CompositionalModel) {
       self.image1.image = UIImage(systemName: "map")
       self.image2.image = UIImage(named: ContentModel.recents.randomElement() ?? "blank")
       self.albumName.text = model.mainTitle
       self.amountOfPhotoLabel.text = String("\(model.numberOfItems)")
   }

   // MARK: Reuse

   override func prepareForReuse() {
       super.prepareForReuse()
       self.image1.image = nil
       self.image2.image = nil
   }
}
