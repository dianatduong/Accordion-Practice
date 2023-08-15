//
//  ViewController.swift
//  Accordion-Practice
//
//  Created by Diana Duong on 8/11/23.
//  Copyright © 2023 Diana Duong. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    
    let twoDimensionalArray = [
        [ "Amanda", "Amber", "Angela", "Anthony", "Aaron" ],
        [ "Benny", "Brandon", "Brenda", "Bethany"],
        [ "Charles", "Christina", "Cynthia", "Colton"]
    ]
    
    @objc func handleShowIndexPath() {
        print("Attempting reload animation of indexPaths.")
        
        //build all the indexPaths we want to reload
        var indexPathsToReload = [IndexPath]()
        
       //build all indexPaths we want to reload
        for section in twoDimensionalArray.indices {
            for row in twoDimensionalArray[section].indices {
                print(section, row)
                
                let indexPath = IndexPath(row: row, section: section)
                indexPathsToReload.append(indexPath)
            }
        }
        //reloading a whole section
        tableView.reloadRows(at: indexPathsToReload, with: .right)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //header label for each section
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = UIColor.lightGray
        return label
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return twoDimensionalArray[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
            
        let name = twoDimensionalArray[indexPath.section][indexPath.row]
        
        //output for each cell
        cell.textLabel?.text = "\(name) - Section: \(indexPath.section) Row: \(indexPath.row)"

        return cell
    }
}

