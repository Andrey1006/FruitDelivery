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
    func reloadDataSource() {
        items = memoryDataBase.productsInBasket.map { itemWithCount in
            return BasketItemViewContent(
                id: itemWithCount.item.id.uuidString,
                image: itemWithCount.item.image,
                title: itemWithCount.item.title,
                price: itemWithCount.item.descriptions,
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
    
    func itemPlusButtonClicked(item: BasketItemViewContent) {
        let uuid = UUID(uuidString: item.id)
        
        if let uuid {
            memoryDataBase.appendToBasket(product: .init(id: uuid, image: item.image, title: item.title, price: Int(item.price) ?? 0, isFavorite: false, descriptions: item.price))
        }
        
        reloadDataSource()
    }
    
    func itemMinusButtonClicked(item: BasketItemViewContent) {
        let uuid = UUID(uuidString: item.id)
        
        if let uuid {
            memoryDataBase.removeFromBasketOneItem(product: .init(id: uuid, image: item.image, title: item.title, price: Int(item.price) ?? 0, isFavorite: false, descriptions: item.price))
        }
        
        reloadDataSource()
    }
    
    func itemCloseButtonClicked(item: BasketItemViewContent) {
        let uuid = UUID(uuidString: item.id)
        
        if let uuid {
            memoryDataBase.removeFromBasket(product: .init(id: uuid, image: item.image, title: item.title, price: Int(item.price) ?? 0, isFavorite: false, descriptions: item.price))
        }
        
        reloadDataSource()
    }
}
