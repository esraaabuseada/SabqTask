//
//  ArticlesCollectionViewCell.swift
//  sab2
//
//  Created by user on 10/27/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class ArticlesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    let placeHolderImage = UIImage(named: "logo")
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImageView.layer.cornerRadius = 30
        
    }
    
    func configur(articlesObj : Materials) {
                var  imageURL = articlesObj.authorImg!
                print(imageURL)
        if let apiUrl:URL = URL(string: imageURL){
                userImageView.sd_setImage(with: apiUrl, placeholderImage: placeHolderImage)
        }else{
            userImageView.image = placeHolderImage
        }
        
    }

}
