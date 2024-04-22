//
//  TableViewCell.swift
//  UMC_Week3.1
//
//  Created by 윤성 on 4/19/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewName: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
