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
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var timeImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var bookmarkImageView: UIImageView!
    @IBOutlet weak var newsBlueLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statisticsLabel: UILabel!
    let placeHolderImage = UIImage(named: "logo")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configur(materials : Materials) {
        var  imageURL="https://image.tmdb.org/t/p/w500/" + materials.coverPhoto!
        print(imageURL)
        let url:URL = URL(string: imageURL)!
        newsImageView.sd_setImage(with: url, placeholderImage: placeHolderImage)
        
        // actorKnownfor.text = sub
    }
}
