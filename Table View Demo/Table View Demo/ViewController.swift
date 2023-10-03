//
//  ViewController.swift
//  Table View Demo
//
//  Created by Meraldo Cazar Jr. on 2023-10-02.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = "This is the cell for \(indexPath.row)"
        return cell;
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

