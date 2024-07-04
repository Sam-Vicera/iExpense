//
//  PasswordRetrievalView.swift
//  iExpense
//
//  Created by Samuel Hernandez Vicera on 7/2/24.
//

import SwiftUI

struct PasswordRetrievalView: View {
    @State private var userInput: String = ""
    
    var body: some View {
        
        VStack {
            LogoView()
            
            Spacer()
            
            VStack {
                VStack(alignment: .leading, spacing: 15){
                    // title, paragraph, textfield, button for request
                    
                    Text("Recover your password")
                        .font(.title2)
                        .foregroundStyle(.fontColor)
                    
                    Text("Please type in the email or phone number corresponding to your account ")
                        .foregroundStyle(.fontColor)
                    
                    HStack{
                        Image(systemName: SfSymbols.email.rawValue)
                        TextField("", text: $userInput)
                    }
                    .underlineTextField()
                    
                }
                .padding()
                
                VStack(alignment:.center){
                    CustomButtonView(label: "Send Recovery Code")
                }
                
            }
            .frame(width: 350, height: 350)
            .background(
                
                Rectangle()
                    .fill(.appBackground)
                        .cornerRadius(12)
                        .shadow(
                            color: Color.black.opacity(0.8),
                            radius: 8,
                            x: 0,
                            y: 0
                        )
                )
           
            
            Spacer()
            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.appBackground)
    }
}

#Preview {
    PasswordRetrievalView()
}
