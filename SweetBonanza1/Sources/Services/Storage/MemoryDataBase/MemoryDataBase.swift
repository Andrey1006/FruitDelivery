//
//  MemoryDataBase.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 21.08.2024.
//

import Foundation

final class MemoryDataBase {
    static var shared: MemoryDataBase = .init()
    
    var productsInBasket: [CountableContainer<ProductDomainModel>] = []
    
    private init() { /*singleton*/ }
    
    func appendToBasket(product: ProductDomainModel) {
        if productsInBasket.contains(where: { $0.item.id == product.id }) {
            changeCount(for: product, delta: 1)
        } else {
            productsInBasket.append(.init(item: product))
        }
    }
    
    func changeCount(for product: ProductDomainModel, delta: Int) {
        guard let container = productsInBasket.first(where: { $0.item.id == product.id }) else {
            return
        }
        
        container.count += delta
    }
}
