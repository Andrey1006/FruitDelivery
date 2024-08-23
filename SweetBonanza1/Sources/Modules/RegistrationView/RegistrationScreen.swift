//
//  RegistrationScreen.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import SwiftUI

struct RegistrationScreen: View {
    // MARK: - Setup
    @ObservedObject private var viewModel: RegistrationViewModel
    
    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
    }

    @State private var showingAlert = false

    var body: some View {
        VStack(spacing: 20) {
            MainTextField(text: $viewModel.name, placeholder: "NAME...")
            MainTextField(text: $viewModel.email, placeholder: "EMAIL...")
            SecureTextField(text: $viewModel.password, placeholder: "PASSWORD...")
            
            MainButton(text: "SIGN UP", fontPalette: .sign, layout: .sign) {
                if isFormValid {
                    viewModel.signUpButtonClicked()
                } else {
                    showingAlert = true
                }
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Something went wrong."), message: Text("Wear sunscreen"), dismissButton: .default(Text("OK")))
            }
            .padding(.top, 8)
            Spacer()
            Button("Do you already have an account \n Sign in") {
                viewModel.haveAccountClicked()
            }
            .foregroundColor(.white)
            .padding(.bottom, 48)
        }
        .padding(.top, 200)
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
    }
}

extension RegistrationScreen: AuthViewModelProtocol {
    var isFormValid: Bool {
        return viewModel.email.isNotEmpty
        && viewModel.email.contains("@")
        && viewModel.password.isNotEmpty
        && viewModel.password.count > 5
        && viewModel.name.isNotEmpty
        
    }
}

#Preview {
    RegistrationScreen(viewModel: .init(name: "", email: "", password: ""))
}
