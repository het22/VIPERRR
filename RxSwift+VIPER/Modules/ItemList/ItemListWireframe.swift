//
//  ItemListWireframe.swift
//  RxSwift+VIPER
//
//  Created Het Song on 02/08/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import UIKit

class ItemListWireframe: ItemListWireframeProtocol {

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ItemListScreen", bundle: Bundle.main)
    }
    
    static func createModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateInitialViewController()
        if let view = viewController as? ItemListView {
            let interactor  = ItemListInteractor()
            let presenter = ItemListPresenter()
            let wireframe = ItemListWireframe()
            
            view.presenter = presenter
            interactor.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireframe = wireframe
            
            return view
        }
        return UIViewController()
    }
}
