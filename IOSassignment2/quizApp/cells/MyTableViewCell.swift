//
//  MyTableViewCell.swift
//  quizApp
//
//  Created by Ashim Dauren on 25.01.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
