//
//  LableButton.swift
//  UIDemo
//
//  Created by MACM18 on 14/04/25.
//

import SwiftUI

struct LableButton: View {
    var image:String
    var title:String
    var compltion:()->Void
    var body: some View {
        Button(action:{
            compltion()
        }){
            VStack(spacing:8){
                Image(image)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(8)
                Text(title)
                    .font(.system(size: 12))
                    .lineLimit(3)
                    .fontWeight(.regular)
                    .foregroundStyle(.black)
            }
        }
    }
}


