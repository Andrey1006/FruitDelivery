//
//  AuthorizationView.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import SwiftUI

struct AuthorizationView: View {
    // MARK: - Setup
    private var viewModel: AuthorizationViewModel
    
    init(viewModel: AuthorizationViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var email: String = ""
    @State private var password: String = ""
    

    var body: some View {
//        ZStack {
            
//            Image("background")
//                .resizable()
//                .ignoresSafeArea()
//                .scaledToFill()
            VStack(spacing: 20) {
                MainTextField(text: $email, placeholder: "EMAIL...")
                    .keyboardType(.emailAddress)
                MainTextField(text: $password, placeholder: "PASSWORD...")
                
                MainButton(text: "SIGN IN", fontPalette: .sign, layout: .sign) {
                    viewModel.signInButtonClicked()
                }
                .padding(.top, 8)
                Spacer()
                Button("you don't have an account yet \n sign up now?") {
                    viewModel.haveNotAccountClicked()
                }
                .foregroundColor(.white)
                .padding(.bottom, 48)
            }
            .padding(.top, 280)
            .padding(.horizontal, 36)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
            .background(
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            )
//        }
    }
}

#Preview {
    AuthorizationView(viewModel: .init(name: "123"))
}
