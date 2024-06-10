//
//  MyAlbumsCell.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 07/06/2024.
//

import UIKit

class MyAlbumsCell: UICollectionViewCell {
    
     static let identifier = "MyAlbumCell"

    // MARK: Outlets

    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
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
        contentView.addSubview(image)
        contentView.addSubview(nameAndAmountStack)
        nameAndAmountStack.addSubview(albumName)
        nameAndAmountStack.addSubview(amountOfPhotoLabel)

    }

    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }

        nameAndAmountStack.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(-10)
            make.leading.bottom.equalToSuperview()
        }

        albumName.snp.makeConstraints { make in
            make.leading.top.equalTo(nameAndAmountStack).offset(10)
        }

        amountOfPhotoLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameAndAmountStack).offset(10)
            make.top.equalTo(albumName.snp.bottom).offset(-5)
        }

    }

    // MARK: Configuration

    func configuration(model: CompositionalModel) {
        self.image.image = UIImage(named: model.image)
        self.albumName.text = model.mainTitle
        self.amountOfPhotoLabel.text = String("\(model.numberOfItems)")
    }

    // MARK: Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
}
