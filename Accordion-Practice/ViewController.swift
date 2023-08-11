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
    
    let names = [
        "Amanda", "Diana", "John", "Jackson", "Melinda"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = UIColor.lightGray
        return label
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return names.count
        } else {
            //returning only 2 cells
            return 2
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        //variable to hold an individual name
        let name = names[indexPath.row]
            
        //output for each cell
        cell.textLabel?.text = "\(name) - Section: \(indexPath.section) Row: \(indexPath.row)"

        return cell
    }
}

