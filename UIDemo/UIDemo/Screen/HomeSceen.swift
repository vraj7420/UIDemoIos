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
            PostRow(post: viewModel.posts[0])
//            List(viewModel.posts, id: \.id) { post in
//                PostRow(post: post)
//                    .background(Color.red)
//            }.background(Color.pink)
               
            
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
