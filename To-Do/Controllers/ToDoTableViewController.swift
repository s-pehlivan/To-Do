//
//  ToDoTableViewController.swift
//  To-Do
//
//  Created by Sora on 4.12.2022.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    
    var items:[String]?
  
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: K.nibFileName, bundle: nil), forCellReuseIdentifier: K.cellId)

        changeNavBarAppearance()
    }
    
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var localTextField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            // what will happen once the user click the Add Item action on the alert
          
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
            cell.titleTextLabel.text = item
        } else {
            cell.titleTextLabel.text = "No Items Added."
        }
        return cell
    }
}


//MARK: - Tableview Delegate Methods

extension ToDoTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        tableView.deselectRow(at: indexPath, animated: true)
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
        
    }
    func filterData() {
        
    }
    
    func deleteData() {
        
    }
}

