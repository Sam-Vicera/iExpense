//
//  SignUpView.swift
//  iExpense
//
//  Created by Samuel Hernandez Vicera on 7/2/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var userEmail: String = ""
    @State private var userFullName: String = ""
    @State private var userPassword: String = ""
    @State private var confirmationPassword: String = ""
    
    var body: some View {
        VStack() {
            Spacer()
            
            VStack(alignment: .leading){
                
                HStack {
                    Text("Sign Up")
                        .font(.title)
                    .foregroundStyle(.fontColor)
                    Spacer()
                }
                .padding(.horizontal, 10)
            }
            
        VStack(spacing: 5){
            Spacer()
            
            InputFieldView(
                text: $userEmail,
                title: "Email",
                placeholder: "String",
                passwordField: false
            )
            InputFieldView(
                text: $userFullName,
                title: "Full Name",
                placeholder: "String" ,
                passwordField: false )
            
            InputFieldView(
                text: $userPassword,
                title: "Password",
                placeholder: "String",
                passwordField: true)
            
            InputFieldView(
                text: $confirmationPassword,
                title: "Confirm Password",
                placeholder: "String" ,
                passwordField: true)
            Spacer()
            
            CustomButtonView(label: "Sign Up")
            
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 25)
            
            HStack{
                Text("Have an Account?")
                    .foregroundStyle(.fontColor)
                Button(){ dismiss() }label: {
                    Text("Sign In")
                }
                
            }
        }
        .toolbar(.hidden, for: .automatic)
        .padding()
        .background(.appBackground)
}
}

#Preview {
    SignUpView()
}
