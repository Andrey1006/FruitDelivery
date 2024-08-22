//
//  AccountViewContent.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import Foundation

struct AccountViewContent: Hashable {
    let id: String
    let image: String
    let name: String
    let email: String

    init(id: String, image: String, name: String, email: String) {
        self.id = id
        self.image = image
        self.name = name
        self.email = email
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: AccountViewContent, rhs: AccountViewContent) -> Bool {
        return lhs.id == rhs.id &&
            lhs.image == rhs.image &&
            lhs.name == rhs.name &&
            lhs.email == rhs.email
    }
}
