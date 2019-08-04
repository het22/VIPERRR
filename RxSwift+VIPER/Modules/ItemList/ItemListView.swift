//
//  ItemListView.swift
//  RxSwift+VIPER
//
//  Created Het Song on 02/08/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import UIKit
import RxCocoa

class ItemListView: UIViewController {

	var presenter: ItemListPresenterProtocol?

    @IBOutlet weak var itemListTableView: ItemListTableView!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func addButtonTapped() {
        presenter?.didAddButtonTap()
    }
}

extension ItemListView: ItemListViewProtocol {
    
    func subscribeItemList(relay itemListRelay: BehaviorRelay<[ItemModel]>) {
        itemListTableView.subscribeItemList(relay: itemListRelay)
    }
    
    func subscribeItemSelected(action: @escaping ItemSelectedAction) {
        itemListTableView.subscribeItemSelected(action: action)
    }
}
