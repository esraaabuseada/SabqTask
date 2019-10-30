//
//  VideosTableViewCell.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class VideosTableViewCell: UITableViewCell {
    @IBOutlet weak private var videosCollectionView: UICollectionView!
    var videosAdapter = VideosAdapter()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        self.videosCollectionView.collectionViewLayout = flowLayout
        self.videosCollectionView.dataSource = videosAdapter
        self.videosCollectionView.delegate = videosAdapter
    
        let cellNib = UINib(nibName: "VideosCollectionViewCell", bundle: nil)
        self.videosCollectionView.register(cellNib, forCellWithReuseIdentifier: "VideosCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reloadCollectionView() {
        videosCollectionView.reloadData()
    }
    
    func configurTableViewCell(videosArray: [Comics]) {
        videosAdapter.add(items: videosArray)
    }
    
}
