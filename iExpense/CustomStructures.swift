//
//  CustomStructures.swift
//  iExpense
//
//  Created by Samuel Hernandez Vicera on 6/27/24.
//

import Foundation
import SwiftUI

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

struct AppleSignInButtonView: View {
    var label: String = "Sign in with  ID"
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            // Handle sign-in with Apple
        }) {
            HStack {
                Image(systemName: "applelogo")
                    .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
                Text("Sign in with Apple")
                    .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
                    .font(.system(size: 16, weight: .bold, design: .default))
            }
            .frame(maxWidth: .infinity, minHeight: 44)
            .padding(.horizontal, 16)
            .background(Color(red: 0/255, green: 0/255, blue: 0/255))
            .cornerRadius(8)
        }

    }
}

struct GoogleSignInButtonView: View {
//    var action: () -> Void
    
    var body: some View {
        Button() {} label: {
            HStack {
                Image("GoogleSignIn")
                    .resizable()
                    .frame(width: 18, height: 18)
                
                Text("Sign in with Google")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .medium, design: .default))
            }
        }
            .frame(maxWidth: .infinity, minHeight: 44)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
        
    }
}
