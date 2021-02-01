//
//  QuizVC.swift
//  quizApp
//
//  Created by Ashim Dauren on 25.01.2021.
//

import UIKit

protocol PassResultData: AnyObject {
    func passResult(count: Int)
}

class QuizVC: UIViewController {

    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    var questions = ["77+77=?","21+23=?","9+2=?","47+4=?","13+5=?","34+0=?","12+7=?","53+8=?","89+9=?","13+70=?"]
    var answers = [154,44,11,51,18,34,19,60,98,83]
    var fakeAnswers = [145,43,12,50,19,18,13,61,89,82]
    var counter = 1
    var result = 0
    
    weak var delegate: PassResultData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.LoadQuestions()
        
    }
    
    @IBAction func button1Func(_ sender: Any) {
        button1.backgroundColor = .green
        result += 1
    }
    @IBAction func button2Func(_ sender: Any) {
        button2.backgroundColor = .red
        button1.backgroundColor = .green
    }
    @IBAction func button3Func(_ sender: Any) {
        button3.backgroundColor = .red
        button1.backgroundColor = .green
    }
    @IBAction func button4Func(_ sender: Any) {
        button4.backgroundColor = .red
        button1.backgroundColor = .green
    }
    
    func clearBackColors(){
        button1.backgroundColor = .gray
        button2.backgroundColor = .gray
        button3.backgroundColor = .gray
        button4.backgroundColor = .gray
    }
    
    func LoadQuestions(){
        questionNumberLabel.text = "\(counter)/10"
        questionField.text = questions[counter-1]
        button1.setTitle("\(answers[counter-1])", for: .normal)
        button2.setTitle("\(fakeAnswers[self.randomize()])", for: .normal)
        button3.setTitle("\(fakeAnswers[self.randomize()])", for: .normal)
        button4.setTitle("\(fakeAnswers[self.randomize()])", for: .normal)
    }
    
    @IBAction func prevFunc(_ sender: Any) {
        if counter != 1 {
            counter -= 1
        }
        self.LoadQuestions()
    }
    
    func randomize() -> Int {
        return Int.random(in: 0..<10)
    }
    
    @IBAction func nextFunc(_ sender: Any) {
        if counter != 10 {
            counter += 1
        }
        if counter == 10 {
            self.LoadQuestions()
            nextButton.setTitle("Finish attempt", for: .normal)
            self.delegate?.passResult(count: result)
            counter += 1
        }
        if counter == 11 {
            let vc = storyboard?.instantiateViewController(identifier: "ResultVC") as! ResultVC
            vc.res = result
            counter = 1
            result = 0
            navigationController?.pushViewController(vc, animated: true)
        }
        self.clearBackColors()
        self.LoadQuestions()
    }
    
}
