//
//  SliderCollectionViewCell.swift
//  sab2
//
//  Created by user on 10/20/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sliderImageView: UIImageView!
    @IBOutlet weak var sliderBigTittle: UILabel!
    @IBOutlet weak var sliderDescription: UILabel!
    @IBOutlet weak var timeImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconhotImageView: UIImageView!
    @IBOutlet weak var statisticsLabel: UILabel!
    @IBOutlet weak var bokmarkImageview: NSLayoutConstraint!
     let placeHolderImage = UIImage(named: "logo")
    
    class var sliderCollectionViewCustomCell : SliderCollectionViewCell {
        let cell = Bundle.main.loadNibNamed("SliderCollectionViewCell", owner: self, options: nil)?.last
        return cell as! SliderCollectionViewCell
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configur(slioderObj : Slider) {
        var  imageURL = slioderObj.coverPhoto ?? " "
        print(imageURL)
        let url:URL = URL(string: imageURL)!
       sliderImageView.sd_setImage(with: url, placeholderImage: placeHolderImage)

    }
}
