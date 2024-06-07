//
//  AlbumViewController.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 06/06/2024.
//

import UIKit

class AlbumViewController: UIViewController {

    // MARK: - Outlets

    private lazy var albumsCollectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SectionsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionsHeader.identifier)
        collectionView.register(SectionHeaderWithSeeAllButton.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderWithSeeAllButton.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups

    private func setupHierarchy() {
        view.addSubview(albumsCollectionView)
    }

    private func setupLayout() {
        albumsCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.equalTo(navigationController?.navigationBar ?? view).offset(15)
            make.bottom.equalTo(tabBarController?.tabBar ?? view)
        }
    }

    // MARK: - CollectionViewLayout

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            <#code#>
        }
    }
}

extension AlbumViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderWithSeeAllButton.identifier, for: indexPath) as? SectionHeaderWithSeeAllButton
            header?.title.text = "My Albums"
            return header ?? UICollectionReusableView()
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionsHeader.identifier, for: indexPath) as? SectionsHeader
            header?.title.text = "People & Places"
            return header ?? UICollectionReusableView()
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionsHeader.identifier, for: indexPath) as? SectionsHeader
            header?.title.text = "Media Types"
            return header ?? UICollectionReusableView()
        case 3:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionsHeader.identifier, for: indexPath) as? SectionsHeader
            header?.title.text = "Utilities"
            return header ?? UICollectionReusableView()
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionsHeader.identifier, for: indexPath) as? SectionsHeader
            header?.title.text = "Other photos"
            return header ?? UICollectionReusableView()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }

}
