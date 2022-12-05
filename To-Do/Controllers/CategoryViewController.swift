//
//  ViewController.swift
//  To-Do
//
//  Created by Sora on 4.12.2022.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {

    let realm = try! Realm()
    var categories: Results<Category>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: K.nibFileName, bundle: nil), forCellReuseIdentifier: K.cellId)
        
        navigationItem.backButtonTitle = ""
        changeNavBarAppearance()
        
        loadData()
       
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
            let newCategory = Category()
            newCategory.name = localTextField.text!
            
            self.saveData(category: newCategory)
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
        
        cell.titleTextLabel.text = categories?[indexPath.row].name ?? "No Categories Added Yet."
        
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
        do {
            try realm.write({
                realm.add(category)
            })
        }catch {
            print("Error saving the category \(error)")
        }
        tableView.reloadData()
    }
    
    func loadData() {
        categories = realm.objects(Category.self)
        tableView.reloadData()
    }
    
}

