//
//  ThankYouPageViewModel.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import Foundation

final class ThankYouPageViewModel {
    var router: ThankYouPageRouterInput!
    
    let id: String
    let image: String
    let title: String

    init(id: String, image: String, title: String) {
        self.id = id
        self.image = image
        self.title = title
    }
    
    public static func == (lhs: ThankYouPageViewModel, rhs: ThankYouPageViewModel) -> Bool {
        return lhs.id == rhs.id &&
            lhs.image == rhs.image &&
            lhs.title == rhs.title
    }
}

extension ThankYouPageViewModel {
    func okButtonClicked() {
        router.okButtonClicked()
    }
}
