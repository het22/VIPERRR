//
//  Persistable.swift
//  RxSwift+VIPER
//
//  Created by Het Song on 05/08/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import RealmSwift

public protocol Persistable {
    associatedtype RealmObject: RealmSwift.Object
    init(realmObject: RealmObject)
    func realmObject() -> RealmObject
}
