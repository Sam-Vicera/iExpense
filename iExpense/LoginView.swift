//
//  LoginView.swift
//  iExpense
//
//  Created by Samuel Hernandez Vicera on 6/26/24.
//

import SwiftUI

struct LoginView: View {
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    
    var body: some View {
        VStack{
            
        VStack(alignment: .center, spacing: 2) {
            Image("IExpenseLogo")
                .resizable()
                .frame(width: 150, height: 150)
            Text("IExpense")
                .comicNeueBoldFont(fontSize: 28)
                .foregroundStyle(.fontColor)

        }
        .padding(30)
        
        HStack {
            
            VStack(alignment: .leading, spacing: 15){
                Text("Hi there! Nice to see you again")
                    .comicNeueItalicFont(fontSize: 22)
                    .foregroundStyle(.fontColor)
                
                Text("Email")
                    .comicNeueLightItalicFont(fontSize: 21)
                    .foregroundStyle(.fontColor)
                
                HStack {
                    Image(systemName: "envelope")
                    TextField("", text: $userEmail)
                }
                .underlineTextField()
                
                
                Text("Password")
                    .comicNeueLightItalicFont(fontSize: 21)
                    .foregroundStyle(.fontColor)
                
                HStack {
                    Image(systemName: "exclamationmark.shield")
                    TextField("", text: $userPassword)
                    Image(systemName: "eye")
                }
                .underlineTextField()
                
                
                
                
            }
            Spacer()
        }
        .padding()
        // navigation link + logic checking combination needed
        VStack(spacing: 10) {
            CustomButtonView(label: "Sign in")
                .padding(.vertical, 15)
            
            Text("You can also sign in with these options below")
                .comicNeueItalicFont(fontSize: 19)
                .foregroundStyle(.fontColor)
        }
        
        HStack(spacing: 45) {
            AppleSignInButtonView()
            
            
            GoogleSignInButtonView()
            
        }
        .padding(.horizontal, 10)
        
        HStack(spacing: 105) {
            Text("Forgot Password?")
                .comicNeueLightItalicFont(fontSize: 21)
                .foregroundStyle(.fontColor)
            
            Text("Sign Up")
                .comicNeueLightItalicFont(fontSize: 21)
                .foregroundStyle(.fontColor)
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 35)
        Spacer()
    }
        .background(.appBackground)
    }
        
}

#Preview {
    LoginView()
}
