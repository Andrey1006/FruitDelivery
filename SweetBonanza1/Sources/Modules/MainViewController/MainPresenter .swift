//
//  MainPresenter .swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 15.08.2024.
//

import Foundation

protocol MainPresenterProtocol {
    func viewDidLoad()
    func pushToDetailProduct(id: String)
    func searchFieldUpdated(text: String)
    func didTapOnOrderButton(id: String)
    func didTapOnFavoriteButton(id: String)
    
    func searchFieldUpdated1(data: String)
}

class MainPresenter {
    var view: MainViewControllerProtocol
    private let router: MainRouterProtocol
    private var viewModel: MainViewModel
    
    private var productsStorage: ProductDomainModelStorage = .init()
    private var products: [ProductDomainModel] = []
    private var memoryDataBase: MemoryDataBase = .shared
    
    init(view: MainViewControllerProtocol!, router: MainRouterProtocol, viewModel: MainViewModel) {
        self.view = view
        self.router = router
        self.viewModel = viewModel
    }
    
}


extension MainPresenter: MainPresenterProtocol {

    func viewDidLoad() {
        reloadData()
//        products = productsStorage.read()
//        
//        viewModel.dataSource.inject(
//            section: .init(
//                id: .productCell,
//                items: products.compactMap { makeCellViewModel(for: $0, size: viewModel.cellSize) },
//                interitemSpacing: viewModel.spacingBetweenItems,
//                lineSpacing: viewModel.spacingBetweenItems
//            )
//        )
//        
//        view.reloadDataSource()
    }
    
    func pushToDetailProduct(id: String) {
        guard let product = products.first(where: { $0.id.uuidString == id }) else {
            return
        }
        
//        router.pushToDetailSet(modulePayload: .init(product: product))
    }
    
    func didTapOnOrderButton(id: String) {
        guard let product = products.first(where: { $0.id.uuidString == id }) else {
            return
        }
        
        memoryDataBase.appendToBasket(product: product)
        router.pushToBasket()
    }
    
    func didTapOnFavoriteButton(id: String) {
        guard var product = products.first(where: { $0.id.uuidString == id }) else {
            return
        }
        var productIsFavorite: Bool = product.isFavorite
        productIsFavorite.toggle()

        product.isFavorite = productIsFavorite
        productsStorage.store(item: product)
        
        viewDidLoad()
    }
    
    func searchFieldUpdated(text: String) {
        guard viewModel.searchText != text else { return }
        viewModel.searchText = text
        print("New text \(text)")
    }
    
    func searchFieldUpdated1(data: String) {
        reloadData(searchProduct: data) //обновление экрана
    }
}

// MARK: - Utils
private extension MainPresenter {
    func reloadData(searchProduct: String = "") {
        products = productsStorage.read()
        
        if searchProduct.isNotEmpty {
            products = products.filter { $0.title.lowercased().contains(searchProduct.lowercased()) }
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
}

extension MainPresenter {
    func makeCellViewModel(
        for model: ProductDomainModel,
        size: CGSize
    ) -> MainKindCellViewModel? {
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
