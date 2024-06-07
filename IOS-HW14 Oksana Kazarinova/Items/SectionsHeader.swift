//
//  SectionsHeader.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 06/06/2024.
//

import UIKit

class SectionsHeader: UICollectionReusableView {

    static let identifier = "Header"

    // MARK: - Outlets

    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super .init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setups

    private func setupHierarchy() {
        addSubview(title)
    }

    private func setupLayout() {
        title.snp.makeConstraints { make in
            make.bottom.left.equalTo(self)
        }
    }

    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}
