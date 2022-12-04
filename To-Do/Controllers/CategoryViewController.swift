//
//  ViewController.swift
//  To-Do
//
//  Created by Sora on 4.12.2022.
//

import UIKit

class CategoryViewController: UITableViewController {

    
    var categories: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: K.nibFileName, bundle: nil), forCellReuseIdentifier: K.cellId)
        
        navigationItem.backButtonTitle = ""
        
        changeNavBarAppearance()
        
        categories = ["number 1", "number 2"]
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoTableViewController
        if let indexPath = tableView.indexPathForSelectedRow {
        }
        
    }
    
    //MARK: - Add New Category
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var localTextField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { action in
            // what will happen once the user click the Add Item action on the alert
            
        }
        
        alert.addAction(action)
        
        alert.addTextField { field in
            field.placeholder = "Create new category"
            localTextField = field
        }
        
        present(alert, animated: true, completion: nil)
    }
}
    

// MARK: - TableView DataSource Methods

extension CategoryViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId, for: indexPath) as! MyCell
        
        cell.titleTextLabel.text = categories?[indexPath.row] ?? "No Categories Added Yet."
        
        return cell
    }
}

//MARK: - TableView Delegate Methods

extension CategoryViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.goToItemsSegue, sender: self)
    }
    
    
    
   

}

//MARK: - Data Manupulation Methods

extension CategoryViewController {
    func saveData(category: Category) {
    }
    
    func loadData() {
    }
    
}

