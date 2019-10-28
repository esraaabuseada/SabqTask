//
//  VideosTableViewCell.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class VideosTableViewCell: UITableViewCell,
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
    @IBOutlet weak private var videosCollectionView: UICollectionView!
    var videosAdapter = VideosAdapter()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        self.videosCollectionView.collectionViewLayout = flowLayout
        self.videosCollectionView.dataSource = self
        self.videosCollectionView.delegate = self
    
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        _ = videosAdapter.count()
        
        return videosAdapter.count()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "VideosCollectionViewCell" ,
            for: indexPath) as? VideosCollectionViewCell else {
            fatalError("cell empty")
        }
        let viodeosObj = videosAdapter.getVideosObj(index: indexPath.row)
     
        collectionCell.configur(videosObj: viodeosObj)
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width,
                      height: collectionView.frame.size.height)
    }
    func configurTableViewCell(videosArray: [Comics]) {
        videosAdapter.add(items: videosArray)
    }
    
}
