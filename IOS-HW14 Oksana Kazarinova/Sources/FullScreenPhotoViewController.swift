//
//  FullScreenPhotoViewController.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 12/06/2024.
//

import UIKit

class FullScreenPhotoViewController: UIViewController {

    // MARK: - Outlets

    lazy var image: UIImageView = {
        let imageView = UIImageView()
        //imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        //imageView.image = 
        return imageView
    }()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupHierarchy()
    }

    // MARK: - Setups

    func setupHierarchy() {
        view.addSubview(image)
    }

    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.center.equalTo(view.center)
        }
    }
}
