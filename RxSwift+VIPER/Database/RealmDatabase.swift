//
//  RealmDatabase.swift
//  RxSwift+VIPER
//
//  Created by Het Song on 02/08/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import RealmSwift

class RealmDatabase {
    static let shared = RealmDatabase()
    private init() {}
    
    var realm: Realm { return try! Realm() }
    func write(_ block: @escaping (() -> Void)) {
        try! realm.write { block() }
    }
}
