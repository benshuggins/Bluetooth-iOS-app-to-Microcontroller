//
//  FeedTableViewController.swift
//  Argontester
//
//  Created by Ben Huggins on 2/18/21.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    
    
    
    var weekdays: [String] = ["monday", "tuesday", "wednesday", "thursday", "friday", "sat", "sun"]

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekdays.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let dayOfWeek = weekdays[indexPath.row]
        // Configure the cell...
       cell.textLabel?.text = dayOfWeek
       

        return cell
    }

}
