//
//  LibraryViewController.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 06/06/2024.
//

import UIKit
import SnapKit

class LibraryViewController: UIViewController {

    // MARK: - Outlets

    private lazy var announcement: UILabel = {
        var label = UILabel()
        label.textColor = .systemBlue
        label.text = "Access failed successfully"
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
        }
    }
}
