//
//  CartManager.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 j1g. All rights reserved.
//

import Foundation
import RealmSwift

class CartManager {
    
    static let sharedManager = CartManager()
    var items: Results<CartItem>!
    
    let cartItem = CartItem()
    //cartItem.name = "Football"

    func count() -> Int {
        if items == nil {
            return 0
        }
        else {
            return items.count
        }
    }
    
    func addCart(productCode : String) {
        // items.insert(productCode, atIndex: 0)
        cartItem.name = productCode
        
        // Save in DB
        let realm = try! Realm()
        try! realm.write {
            realm.add(self.cartItem)
        }
        
        // Load from DB
        items = realm.objects(CartItem)
        print(items)
    }
}
