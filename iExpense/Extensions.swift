//
//  Extensions.swift
//  iExpense
//
//  Created by Samuel Hernandez Vicera on 6/26/24.
//

import Foundation
import SwiftUI

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundStyle(.uniqueBackground)
            .padding(10)
    }
}

struct CustomButtonView: View {
    var label: String
    @State private var isPressed = false
    
    var body: some View {
        Text(label)
            .frame(minWidth: 250)
            .padding()
            .foregroundStyle(.white)
            .background(.uniqueBackground)
            .clipShape(RoundedRectangle(cornerRadius: 12.5))
            .shadow(color: .uniqueColor, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 6)
            .opacity(0.8)
            
    }
}

extension Color {
    static let uniqueColor = Color(red: 85/255 , green: 85/255 , blue: 85/255 )
    
}

extension ShapeStyle where Self == Color {
    static var uniqueBackground : Color { Color(red: 210/255, green: 180/255, blue: 140/255) }
    
    static var appBackground : Color {Color(red: 34/255, green: 49/255, blue: 63/255)}
    
    static var fontColor : Color { Color(red: 245/255, green: 245/255, blue: 220/255) }
}
