//
//  DetailViewController.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 11/06/2024.
//

import UIKit

class DetailViewController: UIViewController {

//    var photo: String {
//            didSet {
//                var index = 0
//                image.image = photo.content[index]
//                index += 1
//            }
//        }
    // MARK: - Outlets

    private lazy var gridCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        layout.sectionHeadersPinToVisibleBounds = true
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
        setupHierarchy()
        setupLayout()
        setupNavigation()
    }

    // MARK: - Setups

    private func setupHierarchy() {
        view.addSubview(gridCollectionView)
    }

    private func setupLayout() {
        gridCollectionView.snp.makeConstraints { make in
            make.left.bottom.right.equalTo(view)
            make.top.equalTo(view)
        }
    }

    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItems
        = [UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: nil, action: nil), UIBarButtonItem(title: "Select", style: .plain, target: nil, action: nil)]
    }
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 54, height: 54)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CompositionalModel.modelsArray[section][section].content.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = gridCollectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.identifier, for: indexPath) as? DetailCell
        //item?.configuration(model: CompositionalModel.modelsArray[indexPath.section][indexPath.section])
       item?.image.image = UIImage(named: CompositionalModel.modelsArray[indexPath.section][indexPath.section].content[indexPath.item])

        return item ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionsHeader.identifier, for: indexPath) as? SectionsHeader
        header?.title.text = "    " + CompositionalModel.modelsArray[indexPath.section][indexPath.item].mainTitle
        return header ?? UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = FullScreenPhotoViewController()
//        viewController.image.image = UIImage(named: selectedItem ?? "blank")
        navigationController?.pushViewController(viewController, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: view.frame.width, height: 30)
    }
}
