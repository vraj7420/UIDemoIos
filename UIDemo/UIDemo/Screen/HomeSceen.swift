//
//  HomeSceen.swift
//  UIDemo
//
//  Created by Vraj on 11/04/25.
//

import SwiftUI

struct HomeSceen: View {
    @ObservedObject var viewModel = HomeScreenViewModel ()
    
    var body: some View {
        VStack{
            homeScreenHeder
                .padding(.top,20)
            TabView(selection:$viewModel.seletedIndexTopTapbar) {
                ForEach(viewModel.topTabBarList.indices, id: \.self) { index in
                    ScrollView {
                        ScrollView {
                            LazyVStack(alignment: .leading, spacing: 0) {
                                ForEach(viewModel.posts, id: \.id) { post in
                                    PostRow(post: post)
                                }
                            }
                            .padding(.top)
                        }
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
        }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
    }
    
    var homeScreenHeder: some View {
        VStack (alignment: .leading,spacing: 24){
            Image(ImageConstants.logoImage)
            TopTabBar(itemList: viewModel.topTabBarList, selectedIndex: $viewModel.seletedIndexTopTapbar)
        }.frame(maxWidth: .infinity,alignment: .top)
            .padding(.horizontal,24)
        
    }
}

#Preview {
    HomeSceen()
}
