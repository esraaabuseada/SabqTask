//
//  SliderTableViewCell.swift
//  sab2
//
//  Created by user on 10/21/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit


class SliderTableViewCell: UITableViewCell,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    var sliderAdapter = SliderAdapter()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 70, height: 80)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        self.sliderCollectionView.collectionViewLayout = flowLayout
        self.sliderCollectionView.dataSource = self
        self.sliderCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "SliderCollectionViewCell", bundle: nil)
        self.sliderCollectionView.register(cellNib, forCellWithReuseIdentifier:"SliderCollectionViewCell")
         //sliderAdapter.reloadData = reloadData
        
    }
    
//    func getSlider(array: [Slider]) {
//        sliderAdapter.add(items: array)
//    }
//    func reloadData(){
//        sliderCollectionView.reloadData()
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderAdapter.count()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier:"SliderCollectionViewCell" , for: indexPath) as! SliderCollectionViewCell
         let sliderObj =  sliderAdapter.getSliderObj(index: indexPath.row)
        collectionCell.configur(slioderObj: sliderObj!)
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width+10 , height: collectionView.frame.size.width+50)
    }
    
    func configurTableViewCell(sliderArray:[Slider])  {
        sliderAdapter.add(items: sliderArray)
        
        
    }
    
}




