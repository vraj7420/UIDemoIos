//
//  BottomTabBar.swift
//  UIDemo
//
//  Created by MACM18 on 15/04/25.
//

import SwiftUI

enum Tab: CaseIterable {
    case home, inbox, share, discover, profile
    
    var title: String {
        switch self {
        case .home: return StringConsatnts.hometabLable
        case .inbox: return StringConsatnts.inboxtabLable
        case .share: return StringConsatnts.sharetabLable
        case .discover: return StringConsatnts.discovertabLable
        case .profile: return StringConsatnts.profiletabLable
        }
    }
    
    var iconName: String {
        switch self {
        case .home: return ImageConstants.homeDeselected
        case .inbox: return ImageConstants.inboxDeselected
        case .share: return ImageConstants.shareSelected
        case .discover: return ImageConstants.discoverDeselected
        case .profile: return ImageConstants.profileDeselected
        }
    }
    
    var selectedIconName: String {
        switch self {
        case .home: return ImageConstants.homeSelected
        case .inbox: return ImageConstants.inboxSelected
        case .share: return ImageConstants.shareSelected
        case .discover: return ImageConstants.discoverSelected
        case .profile: return ImageConstants.profileSelected
        }
    }
}

struct BottomTabBar: View {
    @State private var selectedTab: Tab = .home
    @Binding var path: NavigationPath
    @Binding var selectedFilters: [MusicGenre]

    var body: some View {
        ZStack(alignment: .bottom) {
            // Main content
            Group {
                switch selectedTab {
                case .home:
                    HomeSceen(path: $path)
                case .inbox:
                    Color.red
                case .share:
                    Color.green
                case .discover:
                    Color.blue
                case .profile:
                    Color.orange
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
          

            // Custom Tab Bar
            VStack(spacing: 0) {
                Divider()
                HStack {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Button(action: {
                            selectedTab = tab
                        }) {
                            VStack(spacing: 4) {
                                Image(tab == selectedTab ? tab.selectedIconName : tab.iconName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                Text(tab.title)
                                    .font(.system(size: 10, weight: .medium))
                                    .foregroundColor(tab == selectedTab ? .black : .gray)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(.top, 16)
                .padding(.bottom,8)
                .background(Color.white)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
