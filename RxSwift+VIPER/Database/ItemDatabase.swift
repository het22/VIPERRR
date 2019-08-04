//
//  ItemDatabase.swift
//  RxSwift+VIPER
//
//  Created by Het Song on 02/08/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import RealmSwift

protocol ItemDatabase {
    func readAll() -> [RealmItem]
    func update(realmItem: RealmItem)
    func delete(realmItem: RealmItem)
}

extension RealmDatabase: ItemDatabase {
    
    func readAll() -> [RealmItem] {
        let result = realm.objects(RealmItem.self)
        return Array(result)
    }
    
    func update(realmItem: RealmItem) {
        write{ self.realm.add(realmItem) }
    }
    
    func delete(realmItem: RealmItem) {
        let item = readAll().filter{$0.uuid==realmItem.uuid}.first
        guard let deleteItem = item else { return }
        write{ self.realm.delete(deleteItem) }
    }
}
