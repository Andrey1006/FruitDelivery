//
//  BasketViewModel.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import Foundation

final class BasketViewModel: ObservableObject {
    var router: BasketRouterInput!
    
    @Published var items: [BasketItemViewContent]
    
    private let memoryDataBase: MemoryDataBase = .shared

    init(items: [BasketItemViewContent]) {
        self.items = items
    }
}

extension BasketViewModel {
    func viewAppear() {
        items = memoryDataBase.productsInBasket.map { itemWithCount in
            return BasketItemViewContent(
                id: itemWithCount.item.id.uuidString,
                image: itemWithCount.item.image,
                title: itemWithCount.item.title,
                subtitle: itemWithCount.item.descriptions,
                count: itemWithCount.count
            )
        }
    }
    
    func continueButtonClicked() {
        router.continueButtonClicked()
    }
    
    func selectProductButtonClicked() {
        router.selectProductButtonClicked()
    }
}
