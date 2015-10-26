//
//  ProductManager.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 j1g. All rights reserved.
//

import Foundation

class ProductManager {
    static let sharedManager = ProductManager()
    
    var products = ["Baseball", "Basketball", "Football", "Golf", "Rugby", "Shuttlecock", "Tennis", "Volleyball", "Billiard", "Icehockey", "Pingpong"]
    var prices = ["100", "300", "400", "200", "500", "1100", "900", "600", "800", "1000", "700"]
    
    func count() -> Int {
        return products.count
    }
    
    func productAt() {
        
    }

}