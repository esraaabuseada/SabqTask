//
//  HomeScreenViewController.swift
//  sab2
//
//  Created by user on 10/17/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class HomeScreenViewController:BaseViewController< ListPresenter >,ListViewProtocal,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var homeTableView: UITableView!
    var adapter = ListAdapter()
    var listPresenter: ListPresenterProtocal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listPresenter?.loadMaterial()
        listPresenter?.loadSlider()
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        homeTableView.rowHeight = UITableView.automaticDimension

        let defaultCellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(defaultCellNib, forCellReuseIdentifier: "HomeTableViewCell")
        let sliderCellNib = UINib(nibName: "SliderTableViewCell", bundle: nil)
        homeTableView.register(sliderCellNib, forCellReuseIdentifier: "SliderTableViewCell")
        
        adapter.reloadData = reloadData
        
      
    
    }
    
    
    func getSlider(array: [Slider]) {
        adapter.addSlider(items: array)
       // print("slideraraaaaay",array)
        
    }
    func getMaterial(array: [Materials]) {
        adapter.addMaterials(items: array)
       // print("materiaaalsssaraaaaay",array)
        var count = adapter.getMaterialsCount()
        print("materials count",count)
    }
    func reloadData(){
        homeTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:     return 400
        case 1:     return 150
        default:    return 0
            
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:     return 1
        case 1:     return adapter.getMaterialsCount()
        default:    return 0
          
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0: //Slider
            guard var  cell = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell") as? SliderTableViewCell else { fatalError() }
            cell.frame = tableView.bounds
            cell.layoutIfNeeded()
            cell.sliderCollectionView.reloadData()
        
            
            return cell
            
        case 1: //first cells
            
            guard var  cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else { fatalError() }
           
            return cell
            
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    override func setPresenter(presenter: ListPresenter) {
        listPresenter = presenter
    }
   
}
