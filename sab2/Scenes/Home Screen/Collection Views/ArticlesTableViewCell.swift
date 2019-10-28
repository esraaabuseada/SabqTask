//
//  ArticlesTableViewCell.swift
//  sab2
//
//  Created by user on 10/27/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var articlesCollectionView: UICollectionView!
    var articlesAdapter = ArticlesAdapter()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        self.articlesCollectionView.collectionViewLayout = flowLayout
        self.articlesCollectionView.dataSource = self
        self.articlesCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "ArticlesCollectionViewCell", bundle: nil)
        self.articlesCollectionView.register(cellNib, forCellWithReuseIdentifier:"ArticlesCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = articlesAdapter.count()
        
        return articlesAdapter.count()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier:"ArticlesCollectionViewCell" , for: indexPath) as! ArticlesCollectionViewCell
        let articlesObj = articlesAdapter.getArticlesObj(index: indexPath.row)
        
        collectionCell.configur(articlesObj: articlesObj)
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/4, height: collectionView.frame.size.width/2)
    }
    func configurTableViewCell(articlesArray:[Materials])  {
        articlesAdapter.add(items: articlesArray)
      
    }
}


