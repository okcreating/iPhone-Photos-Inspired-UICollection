//
//  TabBarController.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 06/06/2024.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarController()
        setupTabBarViewContrrollers()
    }

    func setupTabBarController() {
        tabBar.tintColor = .systemBlue
        tabBar.backgroundColor = .white
    }

    func setupTabBarViewContrrollers() {
        let libraryTab = LibraryViewController()
        let libraryIcon = UITabBarItem(title: "Library", image: UIImage(systemName:"photo.on.rectangle.fill"), selectedImage: UIImage(systemName:"photo.on.rectangle.fill"))
        libraryTab.tabBarItem = libraryIcon
        let libraryNavigationController = UINavigationController(rootViewController: libraryTab)

        let forYouTab = ForYouViewController()
        let forYouIcon = UITabBarItem(title: "For you", image: UIImage(systemName: "heart.text.square.fill"), selectedImage: UIImage(systemName:"heart.text.square.fill"))
        forYouTab.tabBarItem = forYouIcon
        let forYouNavigationController = UINavigationController(rootViewController: forYouTab)

        let albumsTab = AlbumViewController()
        let albumsIcon = UITabBarItem(title: "Albums", image: UIImage(systemName: "rectangle.stack.fill"), selectedImage: UIImage(systemName: "rectangle.stack.fill"))
        albumsTab.tabBarItem = albumsIcon
        let albumsNavigationController = UINavigationController(rootViewController: albumsTab)

        let searchTab = SearchViewController()
        let searchIcon = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        searchTab.tabBarItem = searchIcon
        let searchNavigationController = UINavigationController(rootViewController: searchTab)

        let controllers = [libraryNavigationController, forYouNavigationController, albumsNavigationController, searchNavigationController]
        self.setViewControllers(controllers, animated: true)

    }

}

