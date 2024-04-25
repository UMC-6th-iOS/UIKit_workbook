//
//  ScrollableTableViewCell.swift
//  Chapter4
//
//  Created by 문창재 on 4/26/24.
//

import UIKit

class ScrollableTableViewCell: UITableViewCell {
    let imageNames = ["이미지1", "이미지2", "이미지3", "이미지4", "이미지5", "이미지6", "이미지7", "이미지8", "이미지9", "이미지10"]

    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        stackView.axis = .horizontal
//        
        
        stackView.spacing = 0
        stackView.alignment = .leading
        
        for imageName in imageNames {
            let imageView = UIImageView()
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFit
            stackView.addArrangedSubview(imageView)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
