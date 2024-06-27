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
        VStack(alignment: .center, spacing: 2) {
            Image("IExpenseLogo")
                .resizable()
                .frame(width: 150, height: 150)
            Text("IExpense")
                .font(.title)
          
        }
        .padding(30)
        
        HStack {
            VStack(alignment: .leading, spacing: 25){
                Text("Hi there! Nice to see you again")
                
                Text("Email")
                
                HStack {
                    Image(systemName: "envelope")
                    TextField("", text: $userEmail)
                }
                .underlineTextField()  
                
                Text("Password")
                
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
        }
    
        HStack(spacing: 45) {
            Button(){}label: {
                Text(" Sign in with AppleID")
            }
            .frame(width: 135, height: 50)
            .background(.black)
            
            
            Button(){}label: {
                Text("Sign in with Google")
            }
            .frame(width: 135, height: 50)
            .border(.black)
            .background(.white)
            .shadow(color: .black, radius: 15)
            
        }
        .padding(.horizontal, 45)
        .padding(.vertical, 5)
        
        HStack(spacing: 105) {
            Text("Forgot Password?")
            
            Text("Sign Up")
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 35)
        Spacer()
    }
}

#Preview {
    LoginView()
}
