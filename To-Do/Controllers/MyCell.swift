//
//  MyCell.swift
//  To-Do
//
//  Created by Sora on 4.12.2022.
//

import UIKit

class MyCell: BaseTableViewCell {

    @IBOutlet weak var myContainer: UIView!
    @IBOutlet weak var titleTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.myContainer.layer.cornerRadius = 8
        self.myContainer.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
