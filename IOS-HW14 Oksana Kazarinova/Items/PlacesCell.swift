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
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
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
      // stack.alignment = .bottom
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
       contentView.addSubview(image1)

      image1.addSubview(image2)
       contentView.addSubview(nameAndAmountStack)
       nameAndAmountStack.addSubview(albumName)
       nameAndAmountStack.addSubview(amountOfPhotoLabel)
   }

   private func setupLayout() {
      image1.snp.makeConstraints { make in
           make.top.leading.trailing.equalTo(self)
          //make.width.equalTo(contentView.snp.height)
       }

       image2.snp.makeConstraints { make in
          // make.edges.equalTo(image1).offset(60)
           make.width.equalTo(contentView.frame.width / 2.2)
           make.height.equalTo(self.frame.width)
           make.centerX.centerY.equalTo(image1.snp.center)
       }

       nameAndAmountStack.snp.makeConstraints { make in
           make.top.equalTo(image1.snp.bottom)
           make.leading.bottom.equalTo(contentView)
       }

       albumName.snp.makeConstraints { make in
           make.leading.equalTo(nameAndAmountStack)
           make.top.equalTo(nameAndAmountStack).offset(5)
       }

       amountOfPhotoLabel.snp.makeConstraints { make in
           make.leading.equalTo(nameAndAmountStack)
           make.top.equalTo(albumName.snp.bottom)
       }
   }

   // MARK: Configuration

   func configuration(model: CompositionalModel) {
       self.image1.image = UIImage(named: "map")
       self.image2.image = UIImage(named: ContentModel.recents.randomElement() ?? "blank")
       self.albumName.text = model.mainTitle
       self.amountOfPhotoLabel.text = String("\(model.numberOfItems ?? 0)")
   }

   // MARK: Reuse

   override func prepareForReuse() {
       super.prepareForReuse()
       self.image1.image = nil
       self.image2.image = nil
   }
}
