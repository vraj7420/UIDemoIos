//
//  TopTabBar.swift
//  UIDemo
//
//  Created by Vraj on 11/04/25.
//

import SwiftUI

struct TopTabBar: View {
    var itemList : [String]
    @Binding var selectedIndex:Int
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(itemList.indices, id: \.self) { index in
                    Text(itemList[index])
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(selectedIndex == index ? Color.black : Color.gray.opacity(0.2))
                        .foregroundColor(selectedIndex == index ? .white : .primary)
                        .cornerRadius(20)
                        .onTapGesture {
                            withAnimation {
                                selectedIndex = index
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    TopTabBar(itemList: ["Feed","For You","Popular","Genre"],selectedIndex: .constant(1))
}
