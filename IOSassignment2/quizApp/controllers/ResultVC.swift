//
//  ResultVC.swift
//  quizApp
//
//  Created by Ashim Dauren on 25.01.2021.
//

import UIKit

class ResultVC: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    var resultArr = [Int]()
    var res: Int?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let result = res else {
            return
        }
        resultArr.append(result)
        
        resultLabel.text = "\(result)0%"
        
        if result > 5 {
            textLabel.text = "Excellent"
        } else {
            textLabel.text = "Bad"
        }
        
    }
    
    // MARK: - Functions
    
    @IBAction func tryAgainFunc(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func homePageFunc(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.resArr.append(resultArr[resultArr.count-1])
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
