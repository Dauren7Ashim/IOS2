//  SceneDelegate.swift
//  quizApp
//
//  Created by Ashim Dauren on 25.01.2021.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var resArr = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "IMG_0021")
    }

    @IBAction func startFunc(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "QuizVC") as! QuizVC
        navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func historyFunc(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "HistoryVC") as! HistoryVC
        vc.resultArrHistory.append(resArr[resArr.count-1])
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

