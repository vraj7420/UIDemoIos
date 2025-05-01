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
    
    let spacing = 40.0
    let numberOfColumns = 3
    
    private func itemSize(for screenWidth: CGFloat) -> CGFloat {
        let totalSpacing = CGFloat(numberOfColumns + 1) * spacing
        let availableWidth = screenWidth - totalSpacing
        let itemWidth = availableWidth / CGFloat(numberOfColumns)
        return itemWidth
    }
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Filter Genre")
                .font(.title)
                .padding(.horizontal)
            Text("Select a genre")
                .font(.title2)
                .padding(.horizontal)
            GeometryReader { geometry in
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: numberOfColumns),spacing: 16){ ForEach(viewModel.musicGenresList, id: \.id) { genre in
                        VStack{
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
                        .background(Color.random())
                        .foregroundColor(.white)
                        .cornerRadius(16)
                    }
                    }
                    .padding(.horizontal)
                   
                }
            }
            .onAppear {
                let initialColumns = Int(UIScreen.main.bounds.width / 120)
                columns = Array(repeating: GridItem(.flexible()), count: initialColumns)
            }
        }
    }
}



#Preview {
    FilterScreen()
}
