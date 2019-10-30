//
//  ArticlesTableViewCell.swift
//  sab2
//
//  Created by user on 10/27/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {
    @IBOutlet weak private var articlesCollectionView: UICollectionView!
    var articlesAdapter = ArticlesAdapter()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        self.articlesCollectionView.collectionViewLayout = flowLayout
        self.articlesCollectionView.dataSource = articlesAdapter
        self.articlesCollectionView.delegate = articlesAdapter
        
        let cellNib = UINib(nibName: "ArticlesCollectionViewCell", bundle: nil)
        self.articlesCollectionView.register(cellNib, forCellWithReuseIdentifier: "ArticlesCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reloadCollectionView() {
        articlesCollectionView.reloadData()
    }

    func configurTableViewCell(articlesArray: [Materials]) {
        articlesAdapter.add(items: articlesArray)
      
    }
}
