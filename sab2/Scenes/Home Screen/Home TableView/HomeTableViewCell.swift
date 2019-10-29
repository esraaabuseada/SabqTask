//
//  NewsTableViewCell.swift
//  sab2
//
//  Created by user on 10/20/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit
import SDWebImage
import DateToolsSwift
class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak private var newsImageView: UIImageView!
    @IBOutlet weak private var timeImageView: UIImageView!
    @IBOutlet weak private var iconImageView: UIImageView!
    @IBOutlet weak private var newsBlueLabel: UILabel!
    @IBOutlet weak private var postTitleLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var statisticsLabel: UILabel!
    let placeHolderImage = #imageLiteral(resourceName: "logo")
    
    @IBOutlet weak private var playImageView: UIImageView!
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
        let videosCount = materials.videosCount ?? 0
        let  bluelabel = materials.title
        let description = materials.description ?? " "
        let date = materials.publishDate ?? " "
        if ( videosCount > 0 ) {
            playImageView.isHidden = false
        } else {
            playImageView.isHidden = true
        }
        print(imageURL )
        if let apiUrl: URL = URL(string: imageURL ) {
            newsImageView.sd_setImage(with: apiUrl, placeholderImage: placeHolderImage)
        } else {
            newsImageView.image = placeHolderImage
        }
        
//        if (bluelabel?.isEmpty ?? true ) {
//            newsBlueLabel.isHidden = true
//        } else {
//            newsBlueLabel.isHidden = false
//            newsBlueLabel.text = "ffff"
//        }
    newsBlueLabel.text = bluelabel
        guard  let data = description.data(using: String.Encoding.unicode) else {
            fatalError("nodata")
        } // mind "!"
        let attrStr = try? NSAttributedString( // do catch
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil)
        // suppose we have an UILabel, but any element with NSAttributedString will do
        postTitleLabel.attributedText = attrStr
    }
}
