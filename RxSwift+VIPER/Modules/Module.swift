//
//  Module.swift
//  RxSwift+VIPER
//
//  Created by Het Song on 02/08/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import UIKit

enum Module {
    
    case ItemList
    
    var view: UIViewController {
        switch self {
        case .ItemList:
            return ItemListWireframe.createModule()
        }
    }
}
