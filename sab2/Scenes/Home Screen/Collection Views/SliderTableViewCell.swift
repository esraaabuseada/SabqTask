//
//  SliderTableViewCell.swift
//  sab2
//
//  Created by user on 10/21/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit
class SliderTableViewCell: UITableViewCell
     {
    @IBOutlet weak private var sliderCollectionView: UICollectionView!
    @IBOutlet weak private var pageControl: UIPageControl!
 
    var sliderAdapter = SliderAdapter()
    var thisWidth: CGFloat = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thisWidth = CGFloat(self.frame.width)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 70, height: 80)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        self.sliderCollectionView.collectionViewLayout = flowLayout
        self.sliderCollectionView.dataSource = sliderAdapter
        self.sliderCollectionView.delegate = sliderAdapter
        
        let cellNib = UINib(nibName: "SliderCollectionViewCell", bundle: nil)
        self.sliderCollectionView.register(cellNib, forCellWithReuseIdentifier: "SliderCollectionViewCell")
        //sliderAdapter.reloadData = reloadData
        
    }
    
    @IBAction func pagging(_ sender: Any) {
        pageControl.currentPage = sliderAdapter.count()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
   
    
    func reloadCollectionView() {
        sliderCollectionView.reloadData()
    }
    
    func configurTableViewCell(sliderArray: [Slider]) {
      sliderAdapter.add(items: sliderArray)
        
    }
}
