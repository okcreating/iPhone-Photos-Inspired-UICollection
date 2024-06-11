//
//  Model.swift
//  IOS-HW14 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 07/06/2024.
//

import Foundation

struct CompositionalModel: Hashable {
    var nameOfAlbum: Albums
    var mainTitle: String
    var image: String?
    var numberOfItems: Int?
    var lockIcon: String?
}

extension CompositionalModel {
    static let modelsArray = [

        [CompositionalModel(nameOfAlbum: .recents, mainTitle: "Recents", image: ContentModel.recents.last ?? "blank", numberOfItems: ContentModel.recents.count),
         CompositionalModel(nameOfAlbum: .favourites, mainTitle: "Favourites", image: ContentModel.favourites.last ?? "blank", numberOfItems: ContentModel.favourites.count),
         CompositionalModel(nameOfAlbum: .uk, mainTitle: "UK", image: ContentModel.uk.last ?? "blank", numberOfItems: ContentModel.uk.count),
         CompositionalModel(nameOfAlbum: .europe, mainTitle: "Europe", image: ContentModel.europe.last ?? "blank", numberOfItems: ContentModel.europe.count),
         CompositionalModel(nameOfAlbum: .food, mainTitle: "Food", image: ContentModel.food.last ?? "blank", numberOfItems: ContentModel.food.count),
         CompositionalModel(nameOfAlbum: .cars, mainTitle: "Cars", image: ContentModel.cars.last ?? "blank", numberOfItems: ContentModel.cars.count),
         CompositionalModel(nameOfAlbum: .books, mainTitle: "Books", image: ContentModel.books.last ?? "blank", numberOfItems: ContentModel.books.count),
         CompositionalModel(nameOfAlbum: .skiing, mainTitle: "Skiing", image: ContentModel.skiing.last ?? "blank", numberOfItems: ContentModel.skiing.count)],

        [CompositionalModel(nameOfAlbum: .people, mainTitle: "People", numberOfItems: ContentModel.people.count),
         CompositionalModel(nameOfAlbum: .places, mainTitle: "Places", numberOfItems: ContentModel.recents.count - ContentModel.imports.count)],

        [CompositionalModel(nameOfAlbum: .videos, mainTitle: "Videos", image: "video", numberOfItems: ContentModel.videos.count),
         CompositionalModel(nameOfAlbum: .selfies, mainTitle: "Selfies", image: "person.crop.square", numberOfItems: ContentModel.selfies.count),
         CompositionalModel(nameOfAlbum: .portrait, mainTitle: "Portrait", image: "cube", numberOfItems: ContentModel.portrait.count),
         CompositionalModel(nameOfAlbum: .panoramas, mainTitle: "Panoramas", image: "pano", numberOfItems: ContentModel.panoramas.count),
         CompositionalModel(nameOfAlbum: .timelapse, mainTitle: "Time-lapse", image: "timelapse", numberOfItems: ContentModel.timelapse.count),
         CompositionalModel(nameOfAlbum: .slomo, mainTitle: "Slo-mo", image: "slowmo", numberOfItems: ContentModel.slomo.count),
         CompositionalModel(nameOfAlbum: .screenshots, mainTitle: "Screenshots", image: "camera.viewfinder", numberOfItems: ContentModel.screenshots.count)],

        [CompositionalModel(nameOfAlbum: .imports, mainTitle: "Imports", image: "square.and.arrow.down", numberOfItems: ContentModel.imports.count),
        CompositionalModel(nameOfAlbum: .hidden, mainTitle: "Hidden", image: "eye.slash"),
        CompositionalModel(nameOfAlbum: .recentlyDeleted, mainTitle: "Recently Deleted", image: "trash")]
    ]
}

struct ContentModel {
    static var recents: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99"]
    static var favourites: [String] = ["2", "13", "33", "53", "55", "60", "61", "74"]
    static var uk: [String] = ["25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40"]
    static var europe: [String] = ["41", "42", "43", "44", "45", "46", "47", "48", "49", "50"]
    static var food: [String] = ["51", "52", "53", "54", "55", "56", "57", "58"]
    static var cars: [String] = ["15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
    static var people: [String] = ["83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96"]
    static var places: [String] = recents.filter { !imports.contains($0) }
    static var books: [String] = ["65", "66", "67", "68", "69", "70", "71", "72", "73", "74"]
    static var skiing: [String] = ["59", "60", "61", "62", "63", "64"]
    static var videos: [String] = []
    static var selfies: [String] = ["85", "86", "93"]
    static var portrait: [String] = ["83", "84", "87", "89", "91", "92", "94", "95", "96"]
    static var panoramas: [String] = ["97", "98", "99"]
    static var timelapse: [String] = []
    static var slomo: [String] = []
    static var screenshots: [String] = ["75", "76", "77", "78", "79", "80", "81", "82"]
    static var imports: [String] = ["1", "65", "94", "95", "96"]
    static var hidden: [String] = []
    static var recentlyDeleted: [String] = []
}

enum Albums {
    case recents
    case favourites
    case uk
    case europe
    case food
    case cars
    case people
    case places
    case books
    case skiing
    case videos
    case selfies
    case portrait
    case panoramas
    case timelapse
    case slomo
    case screenshots
    case imports
    case hidden
    case recentlyDeleted
}

