//
//  ToDoTableViewController.swift
//  To-Do
//
//  Created by Sora on 4.12.2022.
//

import UIKit
import RealmSwift

class ToDoTableViewController: UITableViewController {
    
    let realm = try! Realm()
    var items: Results<Item>?
    
    var selectedCategory : Category? {
        didSet {
            loadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: K.nibFileName, bundle: nil), forCellReuseIdentifier: K.cellId)

        changeNavBarAppearance()
        view.backgroundColor = UIColor(named: K.Colors.background)
    }
    
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var localTextField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            // what will happen once the user click the Add Item action on the alert
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write({
                        let newItem = Item()
                        newItem.title = localTextField.text!
                        newItem.dateCreated = Date()
                        currentCategory.items.append(newItem)
                    })
                } catch {
                    print("Error saving new item, \(error)")
                }
            }
            self.tableView.reloadData()
        }
        alert.addAction(action)
        
        alert.addTextField { field in
            field.placeholder = "Create new item"
            localTextField = field
        }
        
        present(alert, animated: true, completion: nil)
        
    }

}
//MARK: - Tableview Datasource Methods

extension ToDoTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId, for: indexPath) as! MyCell
        
        if let item = items?[indexPath.row] {
            cell.titleTextLabel.text = item.title
            cell.accessoryType = item.isDone == true ? .checkmark : .none
        } else {
            cell.titleTextLabel.text = "No Items Added."
        }
        return cell
    }
}


//MARK: - Tableview Delegate Methods

extension ToDoTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = items?[indexPath.row] {
            do {
                try realm.write({
                    item.isDone = !item.isDone
                })
            }catch {
                print("Error saving done status: \(error)")
            }
        }
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "") { action, view, boolValue in
            
            if let category = self.selectedCategory {
                do {
                    try self.realm.write {
                        category.items.remove(at: indexPath.row)
                    }
                }catch {
                    print("Error deleting the item: \(error)")
                }
            }
            tableView.reloadData()

        }
        
        deleteAction.backgroundColor = UIColor(named: K.Colors.background)
        deleteAction.image = UIImage(systemName: "trash")?.withTintColor(UIColor(named: K.Colors.title) ?? .white, renderingMode: .alwaysOriginal)
        
        let swipeAction = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return swipeAction
    }
}


//MARK: - SearchBar Delegate

extension ToDoTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
    }
}


//MARK: - Model Manupulation Methods

extension ToDoTableViewController {
    
    func loadData() {
        items = selectedCategory?.items.sorted(byKeyPath: "dateCreated", ascending: true)
        tableView.reloadData()
    }
    func filterData() {
        
    }
}

