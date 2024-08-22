//
//  FavoritesPresenter.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 19.08.2024.
//

import Foundation

protocol FavoritesPresenterProtocol {
    func viewDidLoad()
    func pushToDetailProduct(id: String)
    func searchFieldUpdated(text: String)
}

class FavoritesPresenter {
    var view: FavoritesViewControllerProtocol
    private let router: FavoritesRouterProtocol
    private var viewModel: FavoritesViewModel
    
    var productsStorage: ProductDomainModelStorage = .init()
    private var products: [ProductDomainModel] = []
    
    init(view: FavoritesViewControllerProtocol!, router: FavoritesRouterProtocol, viewModel: FavoritesViewModel) {
        self.view = view
        self.router = router
        self.viewModel = viewModel
    }
    
}


extension FavoritesPresenter: FavoritesPresenterProtocol {
    func searchFieldUpdated(text: String) {
         
    }
    
    func viewDidLoad() {
        products = productsStorage.read()
        
        products.removeAll { product in
            product.isFavorite == false
        }
        
        viewModel.dataSource.inject(
            section: .init(
                id: .productCell,
                items: products.compactMap { makeCellViewModel(for: $0, size: viewModel.cellSize) },
                interitemSpacing: viewModel.spacingBetweenItems,
                lineSpacing: viewModel.spacingBetweenItems
            )
        )
        
        view.reloadDataSource()
    }
    
    func pushToDetailProduct(id: String) {
//        guard let set = sets.first(where: { $0.id.uuidString == id }) else {
//            return
//        }
//
//        router.pushToDetailSet(modulePayload: .init(set: set))
    }
    
    func pushToAllSets() {
//        router.pushAllGeneratedSets()
    }
}

extension FavoritesPresenter {
    func makeCellViewModel(
        for model: ProductDomainModel,
        size: CGSize
    ) -> FavoritesKindCellViewModel? {
        return .productCell(
            .init(
                id: "\(model.id)",
                image: .init(named: model.image)!,
                title: model.title,
                isFavorite: model.isFavorite,
                size: size
            )
        )
    }
}
