//
//  AccountViewModel.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import Foundation

final class AccountViewModel: Hashable {
    let id: String
    let image: String?
    let name: String
    let email: String
    
    private var authService: AuthService = .init()
    var router: AccountRouterInput!

    init(id: String = "", image: String? = nil, name: String = "", email: String = "") {
        self.id = id
        self.image = image
        self.name = name
        self.email = email
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: AccountViewModel, rhs: AccountViewModel) -> Bool {
        return lhs.id == rhs.id &&
            lhs.image == rhs.image &&
            lhs.name == rhs.name &&
            lhs.email == rhs.email
    }
}

extension AccountViewModel {
    func logOutButtonClicked() {
        authService.logout() 
        router.logOutButtonClicked()
    }
        
    
    func deleteAccoountButtonClicked() {
        authService.deleteUserAccount { isSuccess in
            self.router.deleteAccoountButtonClicked()
        }
    }
}
 
