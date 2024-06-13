//
//  FullScreenPhotoViewController.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 12/06/2024.
//

import UIKit

class FullScreenPhotoViewController: UIViewController {

    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
       // imageView.image =
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupHierarchy()
    }

    func setupHierarchy() {
        view.addSubview(image)
    }

    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
