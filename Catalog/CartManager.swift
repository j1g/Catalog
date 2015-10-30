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
import SwiftyJSON

class CartManager {
    
    static let sharedManager = CartManager()
    //var items: Results<CartItem>!
    //let realm = try! Realm()
    
    //let cartItem = CartItem()     // old version
    
    var itemList = [String]()

    /*
    // for REALM version
    func count() -> Int {
        if items == nil {
            return 0
        }
        else {
            return items.count
        }
    }
    */
    
    func count() -> Int {
        return itemList.count
    }
    
    func addCart(productCode : String) {
        // items.insert(productCode, atIndex: 0)    // old version
        /*
        let cartItem = CartItem()
        cartItem.name = productCode
        */
        
        // Save in local DB
        /*
        let realm = try! Realm()
        try! realm.write {
            self.realm.add(cartItem)    // query
        }
        */
        
        // Save in online DB
        sendRequest(productCode)
    }
    
    func loadDB() {
        //items = realm.objects(CartItem)     // query
        //print(items)
        
        // Load from Parse.com
        getRequest()
    }
    
    func sendRequest(productCode: String) {
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
    
    //func getRequest() -> Results<CartItem> {
    func getRequest(){
        let headers = [
            "X-Parse-Application-ID":"ID from parse.com",
            "X-Parse-REST-API-Key":"Key from parse.com",
            "Content-Type":"application/json",
        ]
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        //itemList.removeAll()
        
        Alamofire.request(.GET, "https://api.parse.com/1/classes/CartItem", encoding: encoding, headers: headers).responseJSON  { response in
            var json = JSON(response.result.value!)
            print("")
            //print(json)
            
            let root = json["results"]
            self.itemList.removeAll()
            
            for (_, subJson):(String, JSON) in root {
                let productName = subJson["name"].stringValue
                self.itemList.append(productName)
                print(productName)
            }
        }
    }
}
