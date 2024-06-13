//
//  SectionHeaderWithSeeAllButton.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 07/06/2024.
//

import UIKit

class SectionHeaderWithSeeAllButton: UICollectionReusableView {
    
    static let identifier = "HeaderWithButton"

    // MARK: - Outlets

    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()

    lazy var seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("See All", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
       // button.frame = CGRect(x: 303, y: 14, width: 62, height: 12)
        button.addTarget(self, action: #selector(showDetail), for: .touchUpInside)
        return button
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
        addSubview(seeAllButton)
    }

    private func setupLayout() {
        title.snp.makeConstraints { make in
            make.bottom.left.equalTo(self)
        }
        
        seeAllButton.snp.makeConstraints { make in
            make.bottom.right.equalTo(self)
        }
    }

    // MARK: - Actions

    @objc 
    func showDetail() {
        let seeAllViewController = SeeAllAlbumsViewController()
        let seAllNavigationViewController = UINavigationController(rootViewController: seeAllViewController)
        seAllNavigationViewController.pushViewController(seeAllViewController, animated: true)
    }

    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        seeAllButton.isHidden = true
    }
}
