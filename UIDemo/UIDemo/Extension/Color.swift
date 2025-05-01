//
//  Color.swift
//  UIDemo
//
//  Created by MACM18 on 29/04/25.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        let red = Double.random(in: 0.2...1)
        let green = Double.random(in: 0.2...1)
        let blue = Double.random(in: 0.2...1)
        return Color(red: red, green: green, blue: blue)
    }
}


