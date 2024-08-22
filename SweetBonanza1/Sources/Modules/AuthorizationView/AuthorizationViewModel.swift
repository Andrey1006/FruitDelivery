//
//  AuthorizationViewModel.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import Foundation

final class AuthorizationViewModel {
    var router: AuthorizationRouterInput!
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    public static func == (lhs: AuthorizationViewModel, rhs: AuthorizationViewModel) -> Bool {
        return lhs.name == rhs.name
    }
}

extension AuthorizationViewModel {
    func signInButtonClicked() {
        router.signInButtonClicked()
    }
    
    func haveNotAccountClicked() {
        router.haveNotAccountClicked()
    }
}
