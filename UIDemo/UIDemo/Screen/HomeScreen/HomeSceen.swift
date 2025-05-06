//
//  HomeSceen.swift
//  UIDemo
//
//  Created by Vraj on 11/04/25.
//

import SwiftUI

struct HomeSceen: View {
    @ObservedObject var viewModel = HomeScreenViewModel ()
    @Binding var path: NavigationPath
    @Binding  var seletedFilterList: [MusicGenre]

    var body: some View {
        VStack{
            homeScreenHeder
                .padding(.top,20)
            if seletedFilterList.isEmpty {
                TopTabBar(itemList: viewModel.topTabBarList, selectedIndex: $viewModel.seletedIndexTopTapbar)
                    .padding(.horizontal,24)
                TabView(selection:$viewModel.seletedIndexTopTapbar) {
                    ForEach(viewModel.topTabBarList.indices, id: \.self) { index in
                        ScrollView {
                            renderPostList
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(.page)
                .onChange(of: viewModel.seletedIndexTopTapbar) { _, newIndex in
                    if viewModel.topTabBarList[newIndex] == StringConsatnts.genreTabTitle {
                        path.append(StringConsatnts.NavigationPathString.FilterScreen)
                    }
                }
                .indexViewStyle(.page(backgroundDisplayMode: .never))
            } else{
                VStack{
                    SelectedFilterList(itemList: $seletedFilterList)
                        .padding(.horizontal,24)
                    renderPostList
                }
            }
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
            .onAppear{
                viewModel.seletedIndexTopTapbar = 0
            }
    }
    
    var homeScreenHeder: some View {
        Image(ImageConstants.logoImage)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,24)
    }
    
    var  renderPostList: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(viewModel.posts, id: \.id) { post in
                    PostRow(post: post)
                }
            }
            .padding(.top)
        }
    }
}

