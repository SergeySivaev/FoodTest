//
//  RealmService.swift
//  FoodTest
//
//  Created by macbook on 16/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {
    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    
    static func save<T: Object>(items: [T],
                                config: Realm.Configuration = Realm.Configuration.defaultConfiguration,
                                update: Bool = true) {
        print(config.fileURL!)
        
        do {
            let realm = try Realm(configuration: self.deleteIfMigration)
            
            try realm.write {
                realm.add(items, update: .modified)
                
            }
            
            
        } catch {
            print(error)
        }
    }
    
    static func get<T: Object>(_ type: T.Type,
                               config: Realm.Configuration = Realm.Configuration.defaultConfiguration)
        throws -> Results<T> {
            let realm = try Realm(configuration: self.deleteIfMigration)
            return realm.objects(type)
    }
    
    static func delete<T: Object>(_ recipe: [T],
                                  config: Realm.Configuration = Realm.Configuration.defaultConfiguration) {
        do {
            let realm = try Realm(configuration: self.deleteIfMigration)
            if realm.isEmpty {
                return
            }
            try realm.write {
                realm.delete(recipe)
            }
        } catch {
            print(error)
        }
    }
    
    static func refresh(){
        try! Realm().refresh()
    }
    
    static func deleteAll(config: Realm.Configuration = Realm.Configuration.defaultConfiguration) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print(error)
        }
    }
    
}
