//
//  MusicGenre.swift
//  UIDemo
//
//  Created by MACM18 on 29/04/25.
//

import Foundation

struct MusicGenre {
    let id = UUID()
    let name: String
    let iconURL: String
    var isSelected: Bool
}

var musicGenres: [MusicGenre] = [
    MusicGenre(name: "Pop", iconURL: "https://img.icons8.com/ios/100/musical-notes--v1.png", isSelected: false),
    MusicGenre(name: "Rock", iconURL: "https://img.icons8.com/ios/100/guitar.png", isSelected: false),
    MusicGenre(name: "Hip-Hop / Rap", iconURL: "https://img.icons8.com/ios/100/microphone--v1.png", isSelected: false),
    MusicGenre(name: "R&B / Soul", iconURL: "https://img.icons8.com/ios/100/headphones--v1.png", isSelected: false),
    MusicGenre(name: "Electronic / EDM", iconURL: "https://img.icons8.com/ios/100/speaker--v1.png", isSelected: false),
    MusicGenre(name: "Jazz", iconURL: "https://img.icons8.com/ios/100/saxophone.png", isSelected: false),
    MusicGenre(name: "Blues", iconURL: "https://img.icons8.com/ios/100/gramophone.png", isSelected: false),
    MusicGenre(name: "Country", iconURL: "https://img.icons8.com/ios/100/guitar.png", isSelected: false),
    MusicGenre(name: "Classical", iconURL: "https://img.icons8.com/ios/100/violin.png", isSelected: false),
    MusicGenre(name: "Reggae", iconURL: "https://img.icons8.com/ios/100/musical-notes--v1.png", isSelected: false),
    MusicGenre(name: "Latin", iconURL: "https://img.icons8.com/ios/100/maracas.png", isSelected: false)
]
