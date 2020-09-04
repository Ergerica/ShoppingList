//
//  ViewController.swift
//  ProjectChallenge
//
//  Created by Erica Ross on 4/20/20.
//  Copyright © 2020 Erica Ross. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    //lsit for to insert items to table
    var shoppingList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //creating buttons to add action, does this need refactoring?
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(startGame)),
            UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(startGame))
        ]
        
        //navigationItem.leftBarButtonItems =
        title = "Shopping list"
    }
    //removes everything from shoppinglista arrqy and clers tabe;s
    @objc func startGame() {
        
        shoppingList.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    //sets alerview controller and prompts shopping list item to add
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter shopping item", message: nil,preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
            
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
       }
    func submit(_ answer: String){
        
        shoppingList.insert(answer, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
       }
}

