//
//  ViewController.swift
//  KopiBin
//
//  Created by Tifo Audi Alif Putra on 08/01/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDataSource ,UITableViewDelegate {
    
    @IBOutlet weak var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTable.dataSource = self
        categoryTable.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategory().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create a reusable cell
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = DataService.instance.getCategory()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        }
        return CategoryCell()
    }
    
    //selected one cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //grab the appropriate category
        let category = DataService.instance.getCategory()[indexPath.row]
        performSegue(withIdentifier: "listcoffee", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? ProductsVC {
            productsVC.initProducts(category: sender as! Category)
        }
    }

}

