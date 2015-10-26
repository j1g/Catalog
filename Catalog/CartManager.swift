//
//  CartManager.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 j1g. All rights reserved.
//

import Foundation

class CartManager {
    
    static let sharedManager = CartManager()
    var items = [String]()

    func count() -> Int {
        return items.count
    }
    
    func addCart(productCode : String) {
        items.insert(productCode, atIndex: 0)
    }
}
