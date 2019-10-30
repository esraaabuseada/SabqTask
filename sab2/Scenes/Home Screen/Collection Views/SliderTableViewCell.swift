//
//  SliderTableViewCell.swift
//  sab2
//
//  Created by user on 10/21/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit
class SliderTableViewCell: UITableViewCell {
    @IBOutlet weak private var sliderCollectionView: UICollectionView!
    @IBOutlet weak private var pageControl: UIPageControl!
    var sliderAdapter = SliderAdapter()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 70, height: 80)
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 0
        self.sliderCollectionView.collectionViewLayout = flowLayout
        self.sliderCollectionView.dataSource = sliderAdapter
        self.sliderCollectionView.delegate = sliderAdapter
        
        let cellNib = UINib(nibName: "SliderCollectionViewCell", bundle: nil)
        self.sliderCollectionView.register(cellNib, forCellWithReuseIdentifier: "SliderCollectionViewCell")
        sliderAdapter.setAdaptor(pageControl: pageControl)
        self.pageControl.currentPage = 0
        
    }
    
    func reloadCollectionView() {
        sliderCollectionView.reloadData()
    }
    
    func configurTableViewCell(sliderArray: [Slider]) {
        sliderAdapter.add(items: sliderArray)
        self.pageControl.numberOfPages = sliderArray.count
    }
}
