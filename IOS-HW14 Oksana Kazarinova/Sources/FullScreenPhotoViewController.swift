//
//  FullScreenPhotoViewController.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 12/06/2024.
//

import UIKit

class FullScreenPhotoViewController: UIViewController {
//
//    var photo: CompositionalModel {
//        didSet {
//            image.image = UIImage(named: photo.content.)
//
//          
//
//        }
//    }

    // MARK: - Outlets

    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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
            //make.centerX.centerY.equalTo(view)
            make.top.equalTo(view).offset(20)
            make.center.equalTo(view.center)
        }
    }
}
