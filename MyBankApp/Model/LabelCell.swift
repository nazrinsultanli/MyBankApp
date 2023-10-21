//
//  LabelCell.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 30.09.23.
//

import UIKit

class LabelCell: UITableViewCell {

    @IBOutlet weak var labelCellTableView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLabelInCell (labelTitle: String){
        labelCellTableView.text =  labelTitle
    }
    
}
