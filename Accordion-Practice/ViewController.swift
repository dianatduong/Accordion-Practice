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
    
    var twoDimensionalArray = [
        [ "Amanda", "Amber", "Angela", "Anthony", "Aaron" ],
        [ "Benny", "Brandon", "Brenda", "Bethany"],
        [ "Charles", "Christina", "Cynthia", "Colton"]
    ]
    
    var showIndexPaths = false
    
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
        //true
        showIndexPaths = !showIndexPaths
        
        //determine animation type if true=right/ false=left
        let animationStyle = showIndexPaths ? UITableView.RowAnimation.right : .left
        
        //reloading a whole section
        tableView.reloadRows(at: indexPathsToReload, with: animationStyle)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        
        button.tag = section
        return button
    }
    
    @objc func handleExpandClose(button: UIButton) {
        print("Trying to expand and close")
        
        //close the section first  by deleting rows
        let section = button.tag
        //collect all the rows in the section to remove
        //empty array of IndexPaths
        var indexPathsArray = [IndexPath]()
        
        for row in twoDimensionalArray[section].indices {
            print (section, row)
            
            //what to remove
            let indexPath = IndexPath(row: row, section: section)
            indexPathsArray.append(indexPath)
        }
        
        //delete rows
        twoDimensionalArray[section].removeAll()
        tableView.deleteRows(at: indexPathsArray, with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
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
        
        cell.textLabel?.text = "\(name)"
        
        //if true
        if showIndexPaths {
            //output for each cell
            cell.textLabel?.text = "\(name) - Section: \(indexPath.section) Row: \(indexPath.row)"
        }
        
        return cell
    }
}

