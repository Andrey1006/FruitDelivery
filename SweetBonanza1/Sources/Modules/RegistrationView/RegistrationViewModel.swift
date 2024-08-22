//
//  RegistrationViewModel .swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import Foundation

final class RegistrationViewModel: ObservableObject {
    @Published var name: String
    @Published var email: String
    @Published var password: String
    
    private var authService: AuthService = .init()
    var router: RegistrationRouterInput!

    init(name: String = "", email: String = "", password: String = "") {
        self.name = name
        self.email = email
        self.password = password
    }
}

extension RegistrationViewModel {
    func signUpButtonClicked() {
        Task {
            try await authService.register(email: email, password: password, name: name)
        }
        router.signUpButtonClicked()
    }
    
    func haveAccountClicked() {
        router.haveAccountClicked()
    }
    
    func clearState() {
        name = ""
        email = ""
        password = ""
    }
}
