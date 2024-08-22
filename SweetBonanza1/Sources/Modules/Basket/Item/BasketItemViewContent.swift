//
//  BasketItemViewContent.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import Foundation

struct BasketItemViewContent: Hashable {
    let id: String
    let image: String
    let title: String
    let subtitle: String
    let count: Int

    init(id: String, image: String, title: String, subtitle: String, count: Int) {
        self.id = id
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.count = count
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: BasketItemViewContent, rhs: BasketItemViewContent) -> Bool {
        return lhs.id == rhs.id &&
            lhs.image == rhs.image &&
            lhs.title == rhs.title &&
            lhs.subtitle == rhs.subtitle &&
            lhs.count == rhs.count
    }
}
