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
   
     let placeHolderImage = #imageLiteral(resourceName: "logo")

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configur(slioderObj: Slider) {
        let  imageURL = slioderObj.coverPhoto
        let secondryTitle = slioderObj.secondaryTitle ?? " "
        let description = slioderObj.description ?? " "
        let date = slioderObj.publishDate ?? " "
        print(imageURL ?? "" )
        if let apiUrl: URL = URL(string: imageURL ?? "" ) {
            sliderImageView.sd_setImage(with: apiUrl, placeholderImage: placeHolderImage)
        } else {
            sliderImageView.image = placeHolderImage
        }
        
        sliderBigTittle.text = secondryTitle
        sliderBigTittle.lineBreakMode = .byClipping
        
        guard  let data = description.data(using: String.Encoding.unicode) else {
            fatalError("nodata")
        } // mind "!"
        let attrStr = try? NSAttributedString( // do catch
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil)
        // suppose we have an UILabel, but any element with NSAttributedString will do
       sliderDescription .attributedText = attrStr
        
    
        
    }
}
