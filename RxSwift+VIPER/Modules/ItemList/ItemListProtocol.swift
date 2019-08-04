//
//  ItemListProtocol.swift
//  RxSwift+VIPER
//
//  Created Het Song on 02/08/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import UIKit
import RxCocoa

protocol ItemListWireframeProtocol: class {
    static func createModule() -> UIViewController
}

protocol ItemListInteractorInputProtocol: class {
    
    var presenter: ItemListInteractorOutputProtocol?  { get set }
    
    // INTERACTOR -> PRESENTER
    func requestItemList()
    func requestItemUpdate(item: Item)
    func requestItemDelete(item: Item)
}

protocol ItemListInteractorOutputProtocol: class {
    
    // PRESENTER -> INTERACTOR
    func didReceiveItemList(itemList: [Item])
}

protocol ItemListPresenterProtocol: class {
    
    var view: ItemListViewProtocol? { get set }
    var wireframe: ItemListWireframeProtocol? { get set }
    var interactor: ItemListInteractorInputProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func didAddButtonTap()
}

protocol ItemListViewProtocol: class {

    var presenter: ItemListPresenterProtocol?  { get set }

    // PRESENTER -> VIEW
    func subscribeItemList(relay itemListRelay: BehaviorRelay<[ItemModel]>)
    func subscribeItemSelected(action: @escaping ItemSelectedAction)
}
