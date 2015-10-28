//
//  CartViewController.swift
//  Catalog
//
//  Created by j1g on 2015. 10. 26..
//  Copyright © 2015년 j1g. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let c = CartManager.sharedManager
    @IBOutlet weak var tableView: UITableView!
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(c.count())
        return c.count()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cellCart = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        let cellCart = tableView.dequeueReusableCellWithIdentifier("CART_CELL")!
        
        // old version with String
        //cellCart.textLabel?.text = c.items[indexPath.row]

        // Load from local DB
        //cellCart.textLabel?.text = c.items[indexPath.row].name
        
        // ToDo: Load from parse.com
        cellCart.textLabel?.text = c.itemList[indexPath.row]
        print("dadadada: \(cellCart.textLabel?.text)")
        
        return cellCart
    }
    
    override func viewWillAppear(animated: Bool) {
        //c.loadDB()
        c.getRequest()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}