//
//  ItemListTableViewCell.swift
//  RxSwift+VIPER
//
//  Created by Het Song on 02/08/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import UIKit
import HetSwift

class ItemListTableViewCell: UITableViewCell, NibLoadable, Reusable {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: ItemModel) {
        nameLabel.text = model.name
    }
}
