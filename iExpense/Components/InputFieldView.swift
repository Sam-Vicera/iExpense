//
//  InputFieldView.swift
//  iExpense
//
//  Created by Samuel Hernandez Vicera on 7/2/24.
//

import SwiftUI

struct InputFieldView: View {
    @Binding var text: String
    
    let title: String
    let placeholder: String

    @State private var isSecureFieldActive : Bool = false
    var passwordField: Bool
    
    init(text: Binding<String>, title: String, placeholder: String, isSecureFieldActive: Bool = true, passwordField: Bool) {
         self._text = text
         self.title = title
         self.placeholder = placeholder
         self._isSecureFieldActive = State(initialValue: isSecureFieldActive)
        self.passwordField = passwordField
     }
    
    private var symbol: SfSymbols? {
            switch title.lowercased() {
            case "email":
                return .email
            case "password":
                return .password
            
            case "full name":
                return .fullName
            
            case "confirm password":
                return .confirmPassword
            default:
                return nil
            }
        }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
           
            Text(title)
                .customFont(.subheading, fontSize: 21)
                .foregroundStyle(.fontColor)
            
            HStack {
                if let symbol = symbol {
                    Image(systemName: symbol.rawValue)
                            }
                
                if passwordField && isSecureFieldActive {
                    SecureField("", text: $text)
                        .ignoresSafeArea(.keyboard)
                } else {
                    TextField("", text: $text)
                        .ignoresSafeArea(.keyboard)
                }
                
                Button(){
                    isSecureFieldActive.toggle()
                }label: {
                    if isSecureFieldActive && passwordField{
                        Image(systemName:SfSymbols.secureField.rawValue)
                    } else if passwordField {
                        Image(systemName: SfSymbols.nonSecureField.rawValue)
                    }
                }
            }
            .underlineTextField()
            
        }
        .background(.appBackground)
    }
}

#Preview {
    InputFieldView(text: .constant("name@example.com"), title: "Email Address", placeholder: "name@example.com", isSecureFieldActive: true, passwordField: false)
}
