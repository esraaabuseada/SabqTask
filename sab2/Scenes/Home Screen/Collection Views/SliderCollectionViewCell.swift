//
//  SliderCollectionViewCell.swift
//  sab2
//
//  Created by user on 10/20/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var sliderImageView: UIImageView!
    @IBOutlet weak private var sliderBigTittle: UILabel!
    @IBOutlet weak private var sliderDescription: UILabel!
    @IBOutlet weak private var timeImageView: UIImageView!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var iconhotImageView: UIImageView!
    @IBOutlet weak private var statisticsLabel: UILabel!
    @IBOutlet weak private var bokmarkImageview: NSLayoutConstraint!
     let placeHolderImage = #imageLiteral(resourceName: "logo")

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configur(slioderObj: Slider) {
        let  imageURL = slioderObj.coverPhoto
        print(imageURL ?? "" )
        if let apiUrl: URL = URL(string: imageURL ?? "" ) {
            sliderImageView.sd_setImage(with: apiUrl, placeholderImage: placeHolderImage)
        } else {
            sliderImageView.image = placeHolderImage
        }
        
    }
}
