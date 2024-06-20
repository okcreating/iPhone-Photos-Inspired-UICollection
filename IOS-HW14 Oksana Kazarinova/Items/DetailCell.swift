//
//  DetailCell.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 12/06/2024.
//

import UIKit

class DetailCell: UICollectionViewCell {
    static let identifier = "DetailCell"

   // MARK: Outlets

   lazy var image: UIImageView = {
       let imageView = UIImageView()
       imageView.clipsToBounds = true
       imageView.contentMode = .scaleAspectFill

       return imageView
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
    }

    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }

    // MARK: Configuration

    func configuration(model: CompositionalModel) {
        self.image.image = UIImage(named: model.image ?? "blank")
    }

    // MARK: Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
}
