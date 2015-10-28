//
//  CartManager.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 j1g. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire

class CartManager {
    
    static let sharedManager = CartManager()
    var items: Results<CartItem>!
    let realm = try! Realm()
    
    //let cartItem = CartItem()     // old version

    func count() -> Int {
        if items == nil {
            return 0
        }
        else {
            return items.count
        }
    }
    
    func addCart(productCode : String) {
        // items.insert(productCode, atIndex: 0)    // old version
        let cartItem = CartItem()
        cartItem.name = productCode
        
        // Save in local DB
        //let realm = try! Realm()
        try! realm.write {
            self.realm.add(cartItem)    // query
        }
        
        // Save in online DB
        sendRequest(productCode)
        
    }
    
    func loadDB() {
        items = realm.objects(CartItem)     // query
        //print(items)
    }
    
    
    func sendRequest(productCode: String) {
        
        // Create manager
        let manager = Manager.sharedInstance
        
        // Add Headers
        manager.session.configuration.HTTPAdditionalHeaders = [
            "X-Parse-Application-ID":"PzVoV4C9uJiOt6ZLoSXjtaRXYmc0MY97Pudbyxiy",
            "X-Parse-REST-API-Key":"ew8LXDIujLFOtZBqkiHjDNUhnLHLHhAyQZ0VHFK2",
            "Content-Type":"application/json",
        ]
        
        let headers = [
            "X-Parse-Application-ID":"PzVoV4C9uJiOt6ZLoSXjtaRXYmc0MY97Pudbyxiy",
            "X-Parse-REST-API-Key":"ew8LXDIujLFOtZBqkiHjDNUhnLHLHhAyQZ0VHFK2",
            "Content-Type":"application/json",
        ]
        
        // JSON Body
        let bodyParameters = [
            "name": "\(productCode)"
        ]   //"name": "Volleyball"
        
        print("Body Parameter: \(bodyParameters)")
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        // Fetch Request
        Alamofire.request(.POST, "https://api.parse.com/1/classes/CartItem", parameters: bodyParameters, encoding: encoding, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                print("\nSucces or Fail ???")
                
                switch response.result {
                case .Success:
                    print("Validation Successful")
                case .Failure(let error):
                    print(error)
                }
                
                print("\nFetched.")
        }
        
    }
}
