//
//  BottomTabNavigationStack.swift
//  UIDemo
//
//  Created by MACM18 on 28/04/25.
//

import SwiftUI

struct BottomTabNavigationStack: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            BottomTabBar(path: $path)
                .navigationDestination(for: String.self) { value in
                    switch value {
                    case StringConsatnts.NavigationPathString.FilterScreen:
                        FilterScreen()
                    default:
                        EmptyView()
                    }
                }
        }
    }
}
