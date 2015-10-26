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
    
    
    var data: String!
    

    func addCart(productCode: String) {
        print("\(productCode) added.")
        cart.insert(productCode, atIndex: 0)
        tableView.reloadData()
    }


    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if "DETAIL_SEGUE" == segue.identifier {
            //let detailVC = segue.destinationViewController as! DetailViewController
            //detailVC.data = balls[indexPath.row]
            
            
            // 테이블 뷰의 셀 선택으로 세그웨이 전환시 - sender는 셀
            let cell = sender as! UITableViewCell
            // 셀에서 인덱스 - 사용자 선택 데이터 얻기
            let indexPath = tableView.indexPathForCell(cell)!
            let selected = balls[indexPath.row]
            print("사용자가 선택한 데이터 : \(selected)")
            let detailVC = segue.destinationViewController as! DetailViewController
            detailVC.urlStr = selected
        }
    }
    
    //func indexPathForCell(cell: UITableViewCell) -> NSIndexPath?
/*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! UITableView
        let indexPath = tableView. indexPathForCell(cell)
        let selected = data[indexPath.row]
    }
*/

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("selected \(indexPath.row)")
        
        //셀 선택 후 배경색(회색: 선택했다는 표시) 사라짐.
        //tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        
        data = balls[indexPath.row]
        
/*
        let detailVC = self.storyboard!. instantiateViewControllerWithIdentifier("DETAIL_VC") as! DetailViewController
        let selected = data[indexPath.row]
        detailVC.urlStr = selected
        
        self.showViewController(detailVC, sender: nil)
*/
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

