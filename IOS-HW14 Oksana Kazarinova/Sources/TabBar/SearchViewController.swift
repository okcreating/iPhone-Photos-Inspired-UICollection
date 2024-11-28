//
//  SearchViewController.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 06/06/2024.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Outlets

    private lazy var announcement: UILabel = {
        var label = UILabel()
        label.textColor = .systemBlue
        label.text = "Hi, Dmitry! Tap the Albums tab. There is what you are looking for"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: Setups

    private func setupHierarchy() {
        view.addSubview(announcement)
    }

    private func setupLayout() {
        announcement.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(-70)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
    }
}
