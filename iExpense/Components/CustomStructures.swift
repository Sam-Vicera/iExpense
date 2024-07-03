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
        Button(){} label: {
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

struct LogoView: View {
    @State private var isAnimating = false
    
    var body: some View {
        Image("IExpenseLogo")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .scaleEffect(isAnimating ? 1.1 : 1.0)
            .shadow(color: isAnimating ? Color.fontColor : Color.clear, radius: 10)
            .opacity(isAnimating ? 1.0 : 0.6)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                    self.isAnimating = true
                }
            }
    }
}

struct LoginFields: View {
    @Binding var userEmail: String
    @Binding var userPassword: String
    
    @Binding var isSecureField : Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("Hello, sign in below or sign up with us!")
                .customFont(.subheading, fontSize: 20)
                .foregroundStyle(.fontColor)
            
            Text("Email")
                .customFont(.subheading, fontSize: 21)
                .foregroundStyle(.fontColor)
            
            HStack {
                Image(systemName: SfSymbols.email.rawValue)
                TextField("", text: $userEmail)
                    .textInputAutocapitalization(.never)
            }
            .underlineTextField()
            
            
            Text("Password")
                .customFont(.subheading, fontSize: 21)
                .foregroundStyle(.fontColor)
            
            HStack {
                Image(systemName: SfSymbols.password.rawValue)
                if isSecureField {
                    SecureField("", text: $userPassword)
                } else {
                    TextField("", text: $userPassword)
                }
                
                Button(){
                    isSecureField.toggle()
                }label: {
                    if isSecureField {
                        Image(systemName: SfSymbols.secureField.rawValue)
                    } else {
                        Image(systemName: SfSymbols.nonSecureField.rawValue)
                    }
                }
            }
            .underlineTextField()
            
        }
    }
}


struct PressableButtonStyle: ButtonStyle {
    var pressedColor: Color
    var normalColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(configuration.isPressed ? pressedColor : normalColor)
            .fontDesign(.rounded)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
