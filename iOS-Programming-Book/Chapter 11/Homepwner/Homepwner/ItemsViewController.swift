//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Nicholas Grana on 8/21/17.
//  Copyright © 2017 Nicholas Grana. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    let locale = Locale.current
    
    // connecting with the model (holds the data)
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(_ sender: UIButton) {
        // new item to be added
        let newItem = itemStore.createItem()
        
        // get the index inside the array
        if let index = itemStore.allItems.index(of: newItem) {
            // make the IndexPath from the section (only 1 which is 0) and index
            let indexPath = IndexPath(row: index, section: 0)
            // put it into the tableView
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        if isEditing {
            // change button text
            sender.setTitle("Edit", for: .normal)
            
            // update view
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create an instance of UITableViewCell with default appearence
        // let cell = UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // set the text on the cewll with the description of the ite
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableView
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // if the table view is asking to commit a delete command
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Delete \(item.name)"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                self.itemStore.removeItem(item)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            
            ac.addAction(cancelAction)
            ac.addAction(deleteAction)
            
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
}
