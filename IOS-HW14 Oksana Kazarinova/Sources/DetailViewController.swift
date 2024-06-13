//
//  DetailViewController.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 11/06/2024.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Outlets

    private lazy var gridCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.identifier)
        collectionView.register(SectionsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionsHeader.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItems
        = [UIBarButtonItem(title: "Select", style: .plain, target: nil, action: nil), UIBarButtonItem(title: "...", style: .plain, target: nil, action: nil)]
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups

    private func setupHierarchy() {
        view.addSubview(gridCollectionView)
    }

    private func setupLayout() {
       gridCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.equalTo(navigationController?.navigationBar ?? view).offset(15)
            make.bottom.equalTo(tabBarController?.tabBar ?? view)
        }
    }
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CompositionalModel.modelsArray[section][section].content.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = gridCollectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.identifier, for: indexPath)
        return item
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionsHeader.identifier, for: indexPath) as? SectionsHeader
        header?.title.text = CompositionalModel.modelsArray[indexPath.section][indexPath.item].mainTitle
        return header ?? UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = FullScreenPhotoViewController()
        present(viewController, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: view.frame.width, height: 40)
    }
}
