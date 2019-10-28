//
//  VideosCollectionViewCell.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class VideosCollectionViewCell: UICollectionViewCell {
  let placeHolderImage = UIImage(named: "logo")
    @IBOutlet weak var playImage: UIImageView!
    @IBOutlet weak var coverPhoto: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bpookmarImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configur(videosObj : Comics) {
        var  imageURL = videosObj.authorImg ?? " "
        print(imageURL)
        let apiUrl:URL = URL(string: imageURL)!
        coverPhoto.sd_setImage(with: apiUrl, placeholderImage: placeHolderImage)
        
    }
}
