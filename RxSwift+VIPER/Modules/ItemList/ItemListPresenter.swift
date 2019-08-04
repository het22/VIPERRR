//
//  ItemListPresenter.swift
//  RxSwift+VIPER
//
//  Created Het Song on 02/08/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import UIKit
import RxCocoa

struct ItemListViewModel {
    let itemListRelay = BehaviorRelay<[ItemModel]>(value: [])
}

class ItemListPresenter: ItemListPresenterProtocol {

    weak var view: ItemListViewProtocol?
    var interactor: ItemListInteractorInputProtocol?
    var wireframe: ItemListWireframeProtocol?

    var model = ItemListViewModel()
    
    func viewDidLoad() {
        view?.subscribeItemList(relay: model.itemListRelay)
        view?.subscribeItemSelected { indexPath in
            let itemList = self.model.itemListRelay.value
            if let item = itemList[indexPath.row] as? Item {
                self.interactor?.requestItemDelete(item: item)
            }
        }
        interactor?.requestItemList()
    }
    
    func didAddButtonTap() {
        let itemList = model.itemListRelay.value
        let newItem = Item(uuid: "", name: "item \(itemList.count+1)")
        interactor?.requestItemUpdate(item: newItem)
    }
}

extension ItemListPresenter: ItemListInteractorOutputProtocol {
    
    func didReceiveItemList(itemList: [Item]) {
        model.itemListRelay.accept(itemList)
    }
}
