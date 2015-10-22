//
//  ViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 j1g. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ProductCellDelegate {
    
    func addCart(productCode: String) {
        print("CART DELEGATE ")
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var balls = ["Baseball", "Basketball", "Football", "Golf", "Rugby", "Shuttlecock", "Tennis", "Volleyball", "Billiard", "Icehockey", "Pingpong"]
    var prices = ["100", "300", "400", "200", "500", "900", "600", "700", "800", "1000", "1100"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return balls.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        //custom cell
        let cell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL") as! ProductCell
        //cell.nameLabel.text = "Row \(indexPath.row)"
        
        
        cell.nameLabel.text = balls[indexPath.row]
        cell.priceLabel.text = prices[indexPath.row]
        let itemName = balls[indexPath.row]
        
        let image = UIImage(named: "\(itemName).png")
        cell.imageView?.image = image
        
        //attribute ->  table view cell: style
        //let detail = "Row: \(indexPath.row)"
        //cell.detailTextLabel?.text = detail
        
        cell.productCode = "\(indexPath.row)"
        cell.delegate = self
        
        return cell
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

