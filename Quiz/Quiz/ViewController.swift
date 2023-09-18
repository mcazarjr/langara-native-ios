//
//  ViewController.swift
//  Quiz
//
//  Created by Meraldo Cazar Jr. on 2023-09-18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    let questions: [String] = ["What is 2 x 2?", "What is 5 - 3?", "What is 5 x 5?"]
    let answers: [String] = ["4", "2", "25"]
    
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0;
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }

    @IBAction func showAnswer(_ sender: Any) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
}

