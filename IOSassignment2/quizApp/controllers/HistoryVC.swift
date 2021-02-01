//
//  HistoryVC.swift
//  quizApp
//
//  Created by Kuanyshbay Ibragim on 27.01.2021.
//

import UIKit

class HistoryVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var resultArrHistory = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        tableView.reloadData()
        
    }
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }

}
extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,  numberOfRowsInSection section: Int) -> Int {
        return resultArrHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MyTableViewCell
        let array = resultArrHistory[indexPath.row]
        cell.titleLabel?.text = "Attemp \(indexPath.row+1): \(array)/10"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
