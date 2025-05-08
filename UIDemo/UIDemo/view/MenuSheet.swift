//
//  MenuSheet.swift
//  UIDemo
//
//  Created by Vraj on 08/05/25.
//

import SwiftUI

struct MenuSheet: View {
    let menuList  = ["Report","Block","Unfollow","Share to","Cancel"]
    
    var body: some View {
        VStack(alignment: .center){
            ForEach(menuList, id: \.self) { menuItem in
                Button{
                    
                }label: {
                    Text(menuItem)
                        .padding(20)
                        .foregroundColor(menuItem == "Report" ? Color.red : Color.black)
                }
                .frame(maxWidth: .infinity)
                Divider()
            }
        }
    }
}

