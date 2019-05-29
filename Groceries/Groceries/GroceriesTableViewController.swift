//
//  GroceriesTableViewController.swift
//  Groceries
//
//  Created by Ben Gohlke on 5/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class GroceriesTableViewController: UITableViewController {

    private var groceries: [(name: String, aisle: Int, category: String, count: Int)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGroceries()
        title = "Grocery Store Inventory"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceries.count
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Total inventory: \(determinTotalCount())"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroceryItemCell", for: indexPath) as? GroceryItemTableViewCell else { return UITableViewCell() }
        
        let groceryItem = groceries[indexPath.row]
        
        cell.nameLabel.text = groceryItem.name
        cell.categoryLabel.text = groceryItem.category
        cell.countLabel.text = "\(groceryItem.count) items"
        
        if groceryItem.count < 20 {
            cell.countLabel.textColor = .red
        } else {
            cell.countLabel.textColor = .black
        }
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow,
            let groceryDetailVC = segue.destination as? GroceryDetailViewController else { return }
        let selectedGroceryItem = groceries[selectedIndexPath.row]
        groceryDetailVC.groceryItem = selectedGroceryItem
    }
    
    // MARK: - Private
    
    private func loadGroceries()
    {
        let carrots = (name: "carrots", aisle: 4, category: "produce", count: 25)
        let soup = (name: "tomato soup", aisle: 6, category: "canned goods", count: 100)
        let cereal = (name: "Frosted Flakes", aisle: 2, category: "cereals", count: 43)
        let pringles = (name: "Pringles", aisle: 7, category: "chips", count: 15)
        let tostitos = (name: "Tostitos", aisle: 7, category: "chips", count: 26)
        let seafood = (name: "crab legs", aisle: 1, category: "seafood", count: 8)
        let rice = (name: "Minute Rice", aisle: 2, category: "dry rice and beans", count: 62)
        let turkey = (name: "Boar's Head turkey", aisle: 9, category: "deli", count: 4)
        
        groceries.append(contentsOf: [carrots, soup, cereal, pringles, tostitos, seafood, rice, turkey])
    }
    
    private func determinTotalCount() -> String {
        var totalCount = 0
        for groceryItem in groceries {
            totalCount += groceryItem.count
        }
        return "\(totalCount) items"
    }
}
