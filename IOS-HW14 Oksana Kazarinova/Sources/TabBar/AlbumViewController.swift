//
//  AlbumViewController.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 06/06/2024.
//

import UIKit

protocol AlbumControllerOutput: AnyObject {
    func pushSeeAllAlbums()
}

final class AlbumViewController: UIViewController, AlbumControllerOutput {

    // MARK: - Outlets

    private lazy var albumsCollectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MyAlbumsCell.self, forCellWithReuseIdentifier: MyAlbumsCell.identifier)
        collectionView.register(FavouritesAlbumCell.self, forCellWithReuseIdentifier: FavouritesAlbumCell.identifier)
        collectionView.register(PeopleCell.self, forCellWithReuseIdentifier: PeopleCell.identifier)
        collectionView.register(PlacesCell.self, forCellWithReuseIdentifier: PlacesCell.identifier)
        collectionView.register(MediaTypesAndUtilitiesCell.self, forCellWithReuseIdentifier: MediaTypesAndUtilitiesCell.identifier)
        collectionView.register(UtilitiesWithLockCell.self, forCellWithReuseIdentifier: UtilitiesWithLockCell.identifier)

        collectionView.register(SectionsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionsHeader.identifier)
        collectionView.register(SectionHeaderWithSeeAllButton.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderWithSeeAllButton.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups

    private func setupHierarchy() {
        view.addSubview(albumsCollectionView)
    }

    private func setupLayout() {
        albumsCollectionView.snp.makeConstraints { make in
            make.left.bottom.right.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setupNavigationBar() {
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        let plusBarItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = plusBarItem
    }

    // MARK: - CollectionViewLayout

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {

            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.46))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.46), heightDimension: .fractionalHeight(0.68))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
               // layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(5)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
                sectionLayout.orthogonalScrollingBehavior = .groupPaging

                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(30))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]

                return sectionLayout

            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.48) , heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.96), heightDimension: .fractionalHeight(0.34))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
               layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
                sectionLayout.orthogonalScrollingBehavior = .groupPaging

                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(30))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
                return sectionLayout

            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
                //layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 0, trailing: 2.5)
                layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(5)
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10)
                //sectionLayout.orthogonalScrollingBehavior = .continuous

                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.96), heightDimension: .estimated(30))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]

                return sectionLayout
            }
        }
    }
}

// MARK: Collection Setup

extension AlbumViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        CompositionalModel.modelsArray.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CompositionalModel.modelsArray[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            if CompositionalModel.modelsArray[indexPath.section][indexPath.item].nameOfAlbum == .favourites {
                let item = collectionView.dequeueReusableCell(withReuseIdentifier: FavouritesAlbumCell.identifier, for: indexPath) as! FavouritesAlbumCell
                item.configuration(model: CompositionalModel.modelsArray[indexPath.section][indexPath.item])
                return item
            } else {
                let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCell.identifier, for: indexPath) as! MyAlbumsCell
                item.configuration(model: CompositionalModel.modelsArray[indexPath.section][indexPath.item])
                return item
            }
        case 1:
            if CompositionalModel.modelsArray[indexPath.section][indexPath.item].nameOfAlbum == .people {
                let item = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCell.identifier, for: indexPath) as! PeopleCell
                item.configuration(model: CompositionalModel.modelsArray[indexPath.section][indexPath.item])
                return item
            }
            else if CompositionalModel.modelsArray[indexPath.section][indexPath.item].nameOfAlbum == .places {
                let item = collectionView.dequeueReusableCell(withReuseIdentifier: PlacesCell.identifier, for: indexPath) as! PlacesCell
                item.configuration(model: CompositionalModel.modelsArray[indexPath.section][indexPath.item])
                return item
            } else {
                let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCell.identifier, for: indexPath) as! MyAlbumsCell
                item.configuration(model: CompositionalModel.modelsArray[indexPath.section][indexPath.item])
                return item
            }
        case 3:
            if CompositionalModel.modelsArray[indexPath.section][indexPath.item].nameOfAlbum == .hidden || CompositionalModel.modelsArray[indexPath.section][indexPath.item].nameOfAlbum == .recentlyDeleted {
                let item = collectionView.dequeueReusableCell(withReuseIdentifier: UtilitiesWithLockCell.identifier, for: indexPath) as! UtilitiesWithLockCell
                item.configuration(model: CompositionalModel.modelsArray[indexPath.section][indexPath.item])
                item.accessories = [.disclosureIndicator()]
                return item
            } else {
                let item = collectionView.dequeueReusableCell(withReuseIdentifier: MediaTypesAndUtilitiesCell.identifier, for: indexPath) as! MediaTypesAndUtilitiesCell
                item.configuration(model: CompositionalModel.modelsArray[indexPath.section][indexPath.item])
                item.accessories = [.disclosureIndicator()]
                return item
            }
        default:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MediaTypesAndUtilitiesCell.identifier, for: indexPath) as? MediaTypesAndUtilitiesCell
            item?.configuration(model: CompositionalModel.modelsArray[indexPath.section][indexPath.item])
            item?.accessories = [.disclosureIndicator()]
            return item ?? UICollectionViewCell()
        }
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
        let viewController = DetailViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AlbumViewController {
    func pushSeeAllAlbums() {
        let seeAllAlbumsViewController = SeeAllAlbumsViewController()
        seeAllAlbumsViewController.delegate = self
        navigationController?.pushViewController(seeAllAlbumsViewController, animated: true)
    }
}
