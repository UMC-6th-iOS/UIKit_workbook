//
//  CoronaTableViewCell.swift
//  Chapter9-1
//
//  Created by 문창재 on 6/12/24.
//

import UIKit

class CoronaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sido: UILabel!
    
    @IBOutlet weak var centerName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
