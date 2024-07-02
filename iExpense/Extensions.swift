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



extension Color {
    static let uniqueColor = Color(red: 85/255 , green: 85/255 , blue: 85/255 )
    
}

extension ShapeStyle where Self == Color {
    static var uniqueBackground : Color { Color(red: 210/255, green: 180/255, blue: 140/255) }
    
    static var appBackground : Color {Color(red: 34/255, green: 49/255, blue: 63/255)}
    
    static var fontColor : Color { Color(red: 245/255, green: 245/255, blue: 220/255) }
}


extension View {
    func customFont(_ usage: FontUsage, fontSize: CGFloat) -> some View {
        self.font(.custom(usage.fontName, size: fontSize))
    }
}


enum FontUsage {
       case title
       case subheading
       case paragraph

    
       var fontName: String {
           switch self {
           case .title:
               return "ComicNeue-Bold"
           case .subheading:
               return "ComicNeue-Italic"
           case .paragraph:
               return "ComicNeue-LightItalic"
           }
       }
}

enum SfSymbols: String {
    case email
    case password
    case secureField
    case nonSecureField
    
    var sfSymbol: String {
        switch self {
        case .email:
            return "envelope"
            
        case .password:
            return "exclamationmark.shield"
            
        case .secureField:
            return "eye.slash.fill"
        case .nonSecureField:
            return "eye"
        }
    }
}
