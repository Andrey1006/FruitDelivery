//
//  AuthorizationView.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import SwiftUI

struct AuthorizationView: View {
    // MARK: - Setup
    @ObservedObject private var viewModel: AuthorizationViewModel
    
    init(viewModel: AuthorizationViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var showingAlert = false
    

    var body: some View {
            VStack(spacing: 20) {
                MainTextField(text: $viewModel.email, placeholder: "EMAIL...")
                    .keyboardType(.emailAddress)
//                MainTextField(text: $viewModel.password, placeholder: "PASSWORD...")
                SecureTextField(text: $viewModel.password, placeholder: "PASSWORD...")
                
                MainButton(text: "SIGN IN", fontPalette: .sign, layout: .sign) {
//                    viewModel.signInButtonClicked()
                    if isFormValid {
                        viewModel.signInButtonClicked()
                    } else {
                        showingAlert = true
                    }
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
            .onDisappear {
                viewModel.clearState()
            }
//        }
    }
}

extension AuthorizationView: AuthViewModelProtocol {
    var isFormValid: Bool {
        return viewModel.email.isNotEmpty
        && viewModel.email.contains("@")
        && viewModel.password.isNotEmpty
        && viewModel.password.count > 5
    }
}

#Preview {
    AuthorizationView(viewModel: .init(email: "123", password: "123") )
}
