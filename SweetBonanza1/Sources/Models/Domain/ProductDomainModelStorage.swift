//
//  ProductDomainModelStorage.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import Foundation
import RealmSwift

final class ProductDomainModelStorage {
    let storage: RealmStorage = .shared
    
    func store(item: ProductDomainModel) {
        storage.create(object: transformToDBO(domainModel: item))
    }
    
    func read() -> [ProductDomainModel] {
        guard let results = storage.read(type: RealmDomainModel.self) else {
            return []
        }
    
        return results
//            .sorted(by: \.creationDate, ascending: false)
            .compactMap(transformToDomainModel)
    }
        
    func delete(ids: [UUID]) {
        storage.delete(type: RealmDomainModel.self, where: { $0.id.in(ids) })
    }
}

private extension ProductDomainModelStorage {
    func transformToDBO(domainModel model: ProductDomainModel) -> RealmDomainModel {
        return .init(
            id: model.id, 
            image: model.image,
            title: model.title,
            price: model.price,
            isFavorite: model.isFavorite,
            description: model.descriptions
        )
    }
    
    func transformToDomainModel(model: RealmDomainModel) -> ProductDomainModel? {
        return .init(
            id: model.id,
            image: model.image,
            title: model.title,
            price: model.price,
            isFavorite: model.isFavorite,
            descriptions: model.descriptions
        )
    }
}
