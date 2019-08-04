//
//  Item.swift
//  RxSwift+VIPER
//
//  Created by Het Song on 02/08/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import RealmSwift
import HetSwift

protocol ItemModel {
    var uuid: String { get }
    var name: String { get set }
}

struct Item: ItemModel {
    var uuid: String
    var name: String
}

extension Item: Persistable {
    
    init(realmObject: RealmItem) {
        self.uuid = realmObject.uuid
        self.name = realmObject.name
    }
    
    func realmObject() -> RealmItem {
        let realmItem = RealmItem()
        if self.uuid != "" { realmItem.uuid = self.uuid }
        realmItem.name = self.name
        return realmItem
    }
}

class RealmItem: Object, ItemModel {
    
    override class func primaryKey() -> String? { return "uuid" }
    @objc dynamic var uuid: String = UUID().uuidString
    @objc dynamic var name: String = ""
}
