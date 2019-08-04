//
//  ItemListInteractor.swift
//  RxSwift+VIPER
//
//  Created Het Song on 02/08/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import UIKit

class ItemListInteractor: ItemListInteractorInputProtocol {

    weak var presenter: ItemListInteractorOutputProtocol?
    
    var database: ItemDatabase = RealmDatabase.shared
    
    func requestItemList() {
        let realmItemList = database.readAll()
        let itemList = realmItemList.map { return Item(realmObject: $0) }
        presenter?.didReceiveItemList(itemList: itemList)
    }
    
    func requestItemUpdate(item: Item) {
        let realmItem = item.realmObject()
        database.update(realmItem: realmItem)
        requestItemList()
    }
    
    func requestItemDelete(item: Item) {
        let realmItem = item.realmObject()
        database.delete(realmItem: realmItem)
        requestItemList()
    }
}
