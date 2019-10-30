//
//  ImagesTableViewCell.swift
//  sab2
//
//  Created by user on 10/23/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class ImagesTableViewCell: UITableViewCell {
    @IBOutlet weak private var imagesCollectionView: UICollectionView!
    var imagesAdapter = ImagesAdapter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 3
        flowLayout.minimumInteritemSpacing = 3
        self.imagesCollectionView.collectionViewLayout = flowLayout
        self.imagesCollectionView.dataSource = imagesAdapter
        self.imagesCollectionView.delegate = imagesAdapter
        
        let cellNib = UINib(nibName: "ImagesCollectionViewCell", bundle: nil)
        self.imagesCollectionView.register(cellNib, forCellWithReuseIdentifier: "ImagesCollectionViewCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func reloadCollectionView() {
        imagesCollectionView.reloadData()
    }
    
    func configurTableViewCell(imagesArray: [Comics]) {
        imagesAdapter.add(items: imagesArray)
        
    }
}
