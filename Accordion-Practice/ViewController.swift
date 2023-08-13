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
    
    //let aNames = ["Amanda", "Amber", "Angela", "Anthony", "Aaron" ]
    //let bNames = ["Benny", "Brandon", "Brenda", "Bethany"]
    
    let twoDimensionalArray = [
        [ "Amanda", "Amber", "Angela", "Anthony", "Aaron" ],
        [ "Benny", "Brandon", "Brenda", "Bethany"],
        [ "Charles", "Christina", "Cynthia", "Colton"]
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
        return twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return twoDimensionalArray[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        //variable to hold an individual name
        //let name = names[indexPath.row]
        
         //let name = indexPath.section == 0 ? twoDimensionalArray[0][indexPath.row] : twoDimensionalArray[1][indexPath.row]
            
        let name = twoDimensionalArray[indexPath.section][indexPath.row]
        
        //output for each cell
        cell.textLabel?.text = "\(name) - Section: \(indexPath.section) Row: \(indexPath.row)"

        return cell
    }
}

