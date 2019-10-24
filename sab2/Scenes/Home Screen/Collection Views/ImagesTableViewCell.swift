//
//  ImagesTableViewCell.swift
//  sab2
//
//  Created by user on 10/23/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class ImagesTableViewCell: UITableViewCell,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    var imagesAdapter = ImagesAdapter()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        self.imagesCollectionView.collectionViewLayout = flowLayout
        self.imagesCollectionView.dataSource = self
        self.imagesCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "ImagesCollectionViewCell", bundle: nil)
        self.imagesCollectionView.register(cellNib, forCellWithReuseIdentifier:"ImagesCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = imagesAdapter.count()
        return imagesAdapter.count()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier:"ImagesCollectionViewCell" , for: indexPath) as! ImagesCollectionViewCell
       
        let imagesObj =  imagesAdapter.getImagessObj(index: indexPath.row)
        collectionCell.configur(imagesObj: imagesObj)
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/4, height: collectionView.frame.size.width/2)
    }
    func configurTableViewCell(imagesArray:[Comics])  {
        imagesAdapter.add(items: imagesArray)
        
        
    }
}
