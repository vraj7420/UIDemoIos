//
//  FilterScreenViewModel.swift
//  UIDemo
//
//  Created by MACM18 on 28/04/25.
//

import SwiftUI

class FilterScreenViewModel:ObservableObject {
    
    @Published var musicGenresList = musicGenres
    private var genreColors: [UUID: Color] = [:]
   
    func getColor(for genre: MusicGenre) -> Color {
            if let existing = genreColors[genre.id] {
                return existing
            } else {
                let newColor = Color.random()
                genreColors[genre.id] = newColor
                return newColor
            }
        }

    func loadGenres() {
            for genre in musicGenresList {
                _ = getColor(for: genre)
            }
        }
    
    func selectFilter(selectedItem: MusicGenre) {
        if let index = musicGenresList.firstIndex(where: { $0.id == selectedItem.id }) {
            musicGenresList[index].isSelected.toggle()
        }
    }
}
