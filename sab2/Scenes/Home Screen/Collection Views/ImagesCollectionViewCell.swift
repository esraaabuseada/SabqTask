//
//  ImagesCollectionViewCell.swift
//  sab2
//
//  Created by user on 10/23/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var coverPhoto: UIImageView!
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var blockOverlayImage: UIImageView!
     let placeHolderImage = #imageLiteral(resourceName: "logo")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configur(imagesObj: Comics) {
        let  imageURL = imagesObj.coverPhoto
         let publishDate = imagesObj.publishDate ?? " "
       
        if let apiUrl: URL = URL(string: imageURL ?? "") {
            coverPhoto.sd_setImage(with: apiUrl, placeholderImage: placeHolderImage)
        } else {
             coverPhoto.image = placeHolderImage
        }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        if let date = dateFormatterGet.date(from: publishDate ) {
           timeLabel.text = "\(date)"
        } else {
            print("There was an error decoding the string")
        }
        titleLabel.text = imagesObj.title

    }
}
