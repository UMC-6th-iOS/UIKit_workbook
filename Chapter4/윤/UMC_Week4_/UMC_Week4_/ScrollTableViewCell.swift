//
//  ScrollTableViewCell.swift
//  UMC_Week4
//
//  Created by 윤성 on 4/26/24.
//

import UIKit

class ScrollTableViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    let imageNames = ["Image 1","Image 2","Image 3","Image 4","Image 5","Image 6"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        for imageName in imageNames{
            let image = UIImageView()
            image.image = UIImage(named: imageName)
            image.contentMode = .scaleAspectFit
            stackView.addArrangedSubview(image)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
