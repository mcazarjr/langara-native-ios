//
//  ViewController.swift
//  Night Porter
//
//  Created by Meraldo Cazar Jr. on 2023-10-03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeBackground(_ sender: Any) {
        view.backgroundColor = UIColor.darkGray
        
        //get everything contained in the top level view
        let everything = view.subviews
        
        for eachView in everything {
            //is it a label ?
            if eachView is UILabel {
                //downcast as UILabel
                let currentLabel = eachView as! UILabel
                currentLabel.textColor = UIColor.white
            }
        }
    }
    
}

