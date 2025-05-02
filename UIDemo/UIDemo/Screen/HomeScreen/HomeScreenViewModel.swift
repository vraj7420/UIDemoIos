//
//  HomeScreenViewModel.swift
//  UIDemo
//
//  Created by Vraj on 11/04/25.
//

import Foundation

class HomeScreenViewModel:ObservableObject {
    let  topTabBarList =  [
        StringConsatnts.feedTabTitle,
        StringConsatnts.forYouTabTitle,
        StringConsatnts.popularTabTitle,
        StringConsatnts.genreTabTitle
    ]
    @Published var seletedIndexTopTapbar  = 0
    @Published var selectedFilter: [MusicGenre] = []
    let posts  = postList
}
