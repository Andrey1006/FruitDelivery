//
//  ProductDetailsViewContent .swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import Foundation

struct ProductDetailsViewContent: Hashable {
    let id: String
    let title: String
    let image: String
    let price: String
    let isFavorite: Bool
    let description: String

    init(id: String, title: String, image: String, price: String, isFavorite: Bool, description: String) {
        self.id = id
        self.title = title
        self.image = image
        self.price = price
        self.isFavorite = isFavorite
        self.description = description
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: ProductDetailsViewContent, rhs: ProductDetailsViewContent) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.image == rhs.image &&
            lhs.price == rhs.price &&
            lhs.isFavorite == rhs.isFavorite &&
            lhs.description == rhs.description
    }
}
