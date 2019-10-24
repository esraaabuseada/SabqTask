//
//  ImagesCollectionViewCell.swift
//  sab2
//
//  Created by user on 10/23/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var coverPhoto: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var blockOverlayImage: UIImageView!
     let placeHolderImage = UIImage(named: "logo")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configur(imagesObj : Comics) {
        var  imageURL = imagesObj.coverPhoto ?? " "
        print(imageURL)
        let url:URL = URL(string: imageURL)!
       coverPhoto.sd_setImage(with: url, placeholderImage: placeHolderImage)
        
    }
}
