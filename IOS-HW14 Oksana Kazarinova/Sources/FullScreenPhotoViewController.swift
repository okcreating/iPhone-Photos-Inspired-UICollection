//
//  FullScreenPhotoViewController.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 12/06/2024.
//

import UIKit
import SnapKit

class FullScreenPhotoViewController: UIViewController {

    var photo = String() {
        didSet {
            image.image = UIImage(named: photo)
        }
    }

    // MARK: - Outlets

   private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups

    func setupHierarchy() {
        view.addSubview(image)
    }

    private func setupLayout() {
        image.snp.makeConstraints { make in
        make.size.equalToSuperview()
        }
    }
}
