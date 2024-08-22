//
//  PlacingOrderViewContent.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import Foundation

struct PlacingOrderViewContent: Hashable {
    let id: String
//    let image: String
//    let price: String
//    let isFavorite: Bool
//    let description: String

    init(id: String) {
        self.id = id
//        self.image = image
//        self.price = price
//        self.isFavorite = isFavorite
//        self.description = description
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: PlacingOrderViewContent, rhs: PlacingOrderViewContent) -> Bool {
        return lhs.id == rhs.id
//            lhs.image == rhs.image &&
//            lhs.price == rhs.price &&
//            lhs.isFavorite == rhs.isFavorite &&
//            lhs.description == rhs.description
    }
}
