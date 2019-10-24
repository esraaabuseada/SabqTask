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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//    func configur(person : Person) {
//        var  imageURL="https://image.tmdb.org/t/p/w500/" + person.profilePath!
//        let url:URL = URL(string: imageURL)!
//        actorImage.sd_setImage(with: url, placeholderImage: placeHolderImage)
//        actorName.text = person.name
//        // actorKnownfor.text = sub
//    }
}
