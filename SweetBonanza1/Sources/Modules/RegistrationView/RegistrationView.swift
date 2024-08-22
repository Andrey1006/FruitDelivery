//
//  RegistrationView.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Setup
    public typealias Content = RegistrationViewContent
    
    private var content: Content
    private var action: (() -> Void)?
    
    init(content: Content, action: (() -> Void)? = nil) {
        self.content = content
        self.action = action
    }
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var date = Date()

    var body: some View {
        VStack(spacing: 20) {
            MainTextField(text: $name, placeholder: "NAME...")
            MainTextField(text: $email, placeholder: "EMAIL...")
            MainTextField(text: $password, placeholder: "PASSWORD...")
            MainButton(text: "SIGN UP", fontPalette: .sign, layout: .sign) {
                action?()
            }
            .padding(.top, 8)
            Spacer()
            Button("Do you already have an account \n Sign in") {
                action?()
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
    }
}

#Preview {
    RegistrationView(content: .init(id: "1")) {
        print("PlacingOrderView")
    }
}
