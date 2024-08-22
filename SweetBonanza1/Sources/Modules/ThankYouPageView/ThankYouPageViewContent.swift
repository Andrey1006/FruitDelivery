//
//  ThankYouPageViewContent.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import Foundation

struct ThankYouPageViewContent: Hashable {
    let id: String
    let image: String
    let title: String

    init(id: String, image: String, title: String) {
        self.id = id
        self.image = image
        self.title = title
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: ThankYouPageViewContent, rhs: ThankYouPageViewContent) -> Bool {
        return lhs.id == rhs.id &&
            lhs.image == rhs.image &&
            lhs.title == rhs.title
    }
}
