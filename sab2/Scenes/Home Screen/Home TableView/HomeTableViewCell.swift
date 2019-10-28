//
//  NewsTableViewCell.swift
//  sab2
//
//  Created by user on 10/20/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit
import SDWebImage
class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak private var newsImageView: UIImageView!
    @IBOutlet weak private var timeImageView: UIImageView!
    @IBOutlet weak private var iconImageView: UIImageView!
    @IBOutlet weak private var bookmarkImageView: UIImageView!
    @IBOutlet weak private var newsBlueLabel: UILabel!
    @IBOutlet weak private var postTitleLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var statisticsLabel: UILabel!
    let placeHolderImage = #imageLiteral(resourceName: "logo")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configur(materials: Materials) {
        let  imageURL = materials.coverPhoto ?? " "
        print(imageURL )
        if let apiUrl: URL = URL(string: imageURL ) {
            newsImageView.sd_setImage(with: apiUrl, placeholderImage: placeHolderImage)
        } else {
            newsImageView.image = placeHolderImage
        }
        
    }
}
