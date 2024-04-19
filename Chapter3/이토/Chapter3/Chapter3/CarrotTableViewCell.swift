//
//  CarrotTableViewCell.swift
//  Chapter3
//
//  Created by 문창재 on 4/19/24.
//

import UIKit

class CarrotTableViewCell: UITableViewCell {

    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var imageViewName: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
