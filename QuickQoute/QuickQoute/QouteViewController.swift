//
//  QouteViewController.swift
//  QuickQoute
//
//  Created by Meraldo Cazar Jr. on 2023-12-05.
//

import UIKit

class QouteViewController: UIViewController {

    
    @IBOutlet weak var quickqouteTextView: UILabel!
    
    var selectedQuote: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let selectedQuote = selectedQuote {
            quickqouteTextView.text = selectedQuote
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
