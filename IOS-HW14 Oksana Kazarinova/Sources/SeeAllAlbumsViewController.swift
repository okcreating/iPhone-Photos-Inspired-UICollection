//
//  SeeAllAlbumsViewController.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 09/06/2024.
//

import UIKit

class SeeAllAlbumsViewController: UIViewController {

    // MARK: Outlets

    private lazy var seeAllAlbumsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MyAlbumsCell.self, forCellWithReuseIdentifier: MyAlbumsCell.identifier)
        collectionView.register(FavouritesAlbumCell.self, forCellWithReuseIdentifier: FavouritesAlbumCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Albums"
        view.backgroundColor = .white
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups

    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: .none, action: .none)
    }

    private func setupHierarchy() {
        view.addSubview(seeAllAlbumsCollectionView)
    }

    private func setupLayout() {
        seeAllAlbumsCollectionView.snp.makeConstraints { make in
            make.left.bottom.right.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide)

        }
    }
}

extension SeeAllAlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (170),
               height: (225))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CompositionalModel.modelsArray[0].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if CompositionalModel.modelsArray[0][indexPath.item].nameOfAlbum == .favourites {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: FavouritesAlbumCell.identifier, for: indexPath) as? FavouritesAlbumCell
            item?.configuration(model: CompositionalModel.modelsArray[0][indexPath.item])
            return item ?? UICollectionViewCell()
        }
        else {
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCell.identifier, for: indexPath) as? MyAlbumsCell
            item?.configuration(model: CompositionalModel.modelsArray[0][indexPath.item])
            return item ?? UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
