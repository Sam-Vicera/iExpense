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
    @State private var forgotPassword : Bool = false
    @State private var signUp : Bool = false
    @State private var isSecureField: Bool = true
    
    var body: some View {
        
        NavigationStack {
            VStack{
                
            VStack(alignment: .center, spacing: 2) {
                LogoView()
                
                Text("IExpense")
                    .customFont(.title, fontSize: 28)
                    .foregroundStyle(.fontColor)

            }
            .padding(30)
            
            HStack {
                
                InputFields(userEmail: $userEmail, userPassword: $userPassword, isSecureField: $isSecureField)
                Spacer()
            }
            .padding()
                
            // navigation link + logic checking combination needed
            VStack(spacing: 10) {
                CustomButtonView(label: "Sign in")
                    .padding(.vertical, 15)
                
                Text("You can also sign in with these options below")
                    .customFont(.paragraph, fontSize: 19)
                    .foregroundStyle(.fontColor)
            }
            
            HStack(spacing: 45) {
                AppleSignInButtonView()
                
                
                GoogleSignInButtonView()
                
            }
            .padding(.horizontal, 10)
            
            HStack(spacing: 105) {
                NavigationLink(destination: PasswordRetrievalView()) {
                    
                    Text("Forgot Password?")
                        .customFont(.paragraph, fontSize: 21)
                }
                .buttonStyle(PressableButtonStyle(pressedColor: .fontColor, normalColor: .blue))
              
                
                NavigationLink(destination: SignUpView()){
                    Text("Sign Up")
                        .customFont(.paragraph, fontSize: 21)

                }
                .buttonStyle(PressableButtonStyle(pressedColor: .fontColor, normalColor: .blue))
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 35)
            Spacer()
        }
            .background(.appBackground)
        }
    }
        
}

#Preview {
    LoginView()
}
