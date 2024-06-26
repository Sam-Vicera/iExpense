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
            .foregroundStyle(.black)
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
            
    }
}

extension Color {
    static let uniqueColor = Color(red: 85/255 , green: 85/255 , blue: 85/255 )
}

extension ShapeStyle where Self == Color {
    static var uniqueBackground : Color { Color(red: 210/255 , green: 93/255 , blue: 53/255 ) }
}
