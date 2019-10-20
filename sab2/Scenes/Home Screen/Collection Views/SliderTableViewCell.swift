//
//  SliderTableViewCell.swift
//  sab2
//
//  Created by user on 10/20/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    class var sliderTableViewCustomCell :SliderTableViewCell {
        let cell = Bundle.main.loadNibNamed("SliderTableViewCell", owner: self, options: nil)?.last
        return cell as! SliderTableViewCell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 70, height: 80)
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.minimumInteritemSpacing = 5.0
        self.sliderCollectionView.collectionViewLayout = flowLayout
        
        self.sliderCollectionView.dataSource = self
        self.sliderCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "SliderCollectionViewCell", bundle: nil)
        self.sliderCollectionView.register(cellNib, forCellWithReuseIdentifier:"SliderCollectionViewCell")
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier:"SliderCollectionViewCell" , for: indexPath) as! SliderCollectionViewCell
    
        
      collectionCell.sliderBigTittle.text = "hhhhh"
        return collectionCell
    }
    
}
