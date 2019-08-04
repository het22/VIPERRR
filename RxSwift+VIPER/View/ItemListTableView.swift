//
//  ItemListTableView.swift
//  RxSwift+VIPER
//
//  Created by Het Song on 02/08/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ItemListTableView: UITableView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        register(ItemListTableViewCell.self)
    }
    
    private var itemListBag = DisposeBag()
    public func subscribeItemList(relay itemListRelay: BehaviorRelay<[ItemModel]>) {
        itemListBag = DisposeBag()
        itemListRelay
            .bind(to: self.rx.items(cellIdentifier: ItemListTableViewCell.reuseIdentifier)) {
                (row, model, cell: ItemListTableViewCell) in
                cell.configure(model: model)
            }
            .disposed(by: itemListBag)
    }
    
    private var actionBag = DisposeBag()
    public func subscribeItemSelected(action: @escaping ItemSelectedAction) {
        actionBag = DisposeBag()
        self.rx.itemSelected
            .subscribe{ action($0.element!) }
            .disposed(by: actionBag)
    }
}
