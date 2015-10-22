//
//  ViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 j1g. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ProductCellDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var balls = ["Baseball", "Basketball", "Football", "Golf", "Rugby", "Shuttlecock", "Tennis", "Volleyball", "Billiard", "Icehockey", "Pingpong"]
    var prices = ["100", "300", "400", "200", "500", "1100", "900", "600", "800", "1000", "700"]
    var cart = [String]()
    

    func addCart(productCode: String) {
        print("\(productCode) added.")
        cart.insert(productCode, atIndex: 0)
        //cart.append(productCode)
        tableView.reloadData()
    }


    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // 1
        // Return the number of sections.
        return 2
    }

    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        /*switch section {
        case 0:
            return "Catalog"
        }*/
        
        if section == 0 {
            return "Catalog"
        } else {
            return "Cart"
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return balls.count
        } else {
            return cart.count
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
        
            //custom cell
            let cell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL") as! ProductCell
            //cell.nameLabel.text = "Row \(indexPath.row)"
            cell.nameLabel.text = balls[indexPath.row]

            cell.priceLabel.text = prices[indexPath.row]
            
            let itemName = balls[indexPath.row]
            let image = UIImage(named: "\(itemName).png")
            cell.imageView?.image = image
        
            //cell.productCode = "\(indexPath.row)"
            cell.productCode = balls[indexPath.row]
            cell.delegate = self

            return cell
        }
        else {
            //print("owiejfoiwejfoiwejfiojweiof")
            let cellCart = tableView.dequeueReusableCellWithIdentifier("CART_CELL")!
            cellCart.textLabel?.text = cart[indexPath.row]
            
            return cellCart
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("selected \(indexPath.row)")
        
        //셀 선택 후 배경색(회색: 선택했다는 표시) 사라짐.
        //tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

