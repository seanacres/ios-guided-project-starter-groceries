//
//  GroceryDetailViewController.swift
//  Groceries
//
//  Created by Sean Acres on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class GroceryDetailViewController: UIViewController {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var aisleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var groceryItem: (name: String, aisle: Int, category: String, count: Int)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = groceryItem.name
        categoryLabel.text = groceryItem.category
        aisleLabel.text = "Aisle \(groceryItem.aisle)"
        countLabel.text = "\(groceryItem.count) items"
        if groceryItem.count < 20 {
            countLabel.textColor = .red
        }
    }

}
