//
//  SelectedFilterList.swift
//  UIDemo
//
//  Created by MACM18 on 06/05/25.
//

import SwiftUI

struct SelectedFilterList: View {
    @Binding var itemList : [MusicGenre]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(itemList.indices, id: \.self) { index in
                    HStack(spacing: 16){
                        HStack{
                            AsyncImage(url: URL(string: itemList[index].iconURL)) { image in
                                image.resizable()
                                    .background(Color.random())
                            } placeholder: {
                                ProgressView()
                                    .foregroundColor(.white)
                            }
                            .frame(width: 20, height: 20)
                            .cornerRadius(10)
                            Text(itemList[index].name)
                                .foregroundColor(.white)
                        }
                        Button(action: {
                            itemList.removeAll { $0.id == itemList[index].id }
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                        }
                    }.padding(.vertical, 8)
                    .padding(.horizontal, 8)
                    .background(Color.black )
                    .cornerRadius(20)
                }
            }
        }
    }
}

