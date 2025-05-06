//
//  FilterScreen.swift
//  UIDemo
//
//  Created by MACM18 on 28/04/25.
//

import SwiftUI

struct FilterScreen: View {
    
    @State private var columns: [GridItem] = []
    @ObservedObject var viewModel = FilterScreenViewModel()
    @Binding  var seletedFilterList: [MusicGenre]

    
    let spacing = 40.0
    let numberOfColumns = 3
    
    private func itemSize(for screenWidth: CGFloat) -> CGFloat {
        let totalSpacing = CGFloat(numberOfColumns + 1) * spacing
        let availableWidth = screenWidth - totalSpacing
        let itemWidth = availableWidth / CGFloat(numberOfColumns)
        return itemWidth
    }
    
    @ViewBuilder
    func itemFilter(genre:MusicGenre,geometry:GeometryProxy) -> some View {
            VStack {
                AsyncImage(url: URL(string: genre.iconURL)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 40, height: 40)
                Text(genre.name)
                    .font(.body)
                    .foregroundColor(.black)
            }
            .frame(width: itemSize(for: geometry.size.width), height: itemSize(for: geometry.size.width),alignment:.center)
            .padding()
            .background(viewModel.getColor(for: genre))
            .foregroundColor(.white)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(genre.isSelected ? Color.black : Color.clear, lineWidth: 2)
            )
    }
    
    var body: some View {
        VStack (alignment: .leading){
            Text(StringConsatnts.filterGenreTitle)
                .font(.title)
                .padding(.horizontal)
            Text(StringConsatnts.selectGenreTitle)
                .font(.title2)
                .padding(.horizontal)
            GeometryReader { geometry in
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: numberOfColumns),spacing: 16){ ForEach(viewModel.musicGenresList, id: \.id) { genre in
                        Button{
                            toggleSelection(of: genre)
                        }label: {
                            itemFilter(genre: genre, geometry: geometry)
                        }
                    }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
            }
            .onAppear {
                let initialColumns = Int(UIScreen.main.bounds.width / 120)
                columns = Array(repeating: GridItem(.flexible()), count: initialColumns)
                viewModel.loadGenres()
            }
        }
    }
    
    private func toggleSelection(of genre: MusicGenre) {
           viewModel.selectFilter(selectedItem: genre)
          if let idx = seletedFilterList.firstIndex(where: { $0.id == genre.id }) {
              seletedFilterList.remove(at: idx)
          } else {
              seletedFilterList.append(genre)
          }
      }
}
