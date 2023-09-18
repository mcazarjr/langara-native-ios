//
//  ViewController.swift
//  Converter
//
//  Created by Meraldo Cazar Jr. on 2023-09-18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convertTemp(_ sender: Any) {
        guard let tempString = tempText.text
        else {
            return
        }
        
        if let fahrenheit = Double(tempString) {
            let celsius = (fahrenheit - 32) / 1.8
            let resultText = "Celsius \(celsius)"
            resultLabel.text = resultText
        }
    }
}

