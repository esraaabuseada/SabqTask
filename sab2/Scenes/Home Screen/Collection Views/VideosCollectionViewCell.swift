//
//  VideosCollectionViewCell.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class VideosCollectionViewCell: UICollectionViewCell {
  let placeHolderImage = #imageLiteral(resourceName: "logo")
    @IBOutlet weak private var playImage: UIImageView!
    @IBOutlet weak private var coverPhoto: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var bpookmarImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configur(videosObj: Comics) {
        
        let  imageURL = videosObj.authorImg ?? " "
        print(imageURL )
        if let apiUrl: URL = URL(string: imageURL ) {
            coverPhoto.sd_setImage(with: apiUrl, placeholderImage: placeHolderImage)
        } else {
            coverPhoto.image = placeHolderImage
        }
        
    }
}
