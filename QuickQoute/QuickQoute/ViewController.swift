//
//  ViewController.swift
//  QuickQoute
//
//  Created by Meraldo Cazar Jr. on 2023-12-05.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    let qoutes = ["I love you more...", "There is nothing permanent...", "You cannot shake hands...", "Lord, make me an instrument..."];
    var selectedQoute: String? = "passed string"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qoutes.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        
        //Content
        myCell.textLabel?.text = qoutes[indexPath.row]
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you selected row \(indexPath.row)")
        selectedQoute = qoutes[indexPath.row]
        performSegue(withIdentifier: "QuickQuoteSeg", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "QuickQuoteSeg" {
            guard let quickQuoteViewController = segue.destination as? QouteViewController else {
                return
            }
            quickQuoteViewController.selectedQuote = selectedQoute
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Quick Quotes"
    }
}

