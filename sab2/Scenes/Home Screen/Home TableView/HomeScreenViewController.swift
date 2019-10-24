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
    var listPresenter :ListPresenter?
    var newsAdapter = NewsAdapter()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        listPresenter?.loadMaterial()
        listPresenter?.loadSlider()
        listPresenter?.loadVideos()
        listPresenter?.loadImage()
        
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        
        // datasource and delegate in adapter
        //        self.homeTableView.delegate = newsAdapter
        //        self.homeTableView.dataSource = newsAdapter
        
        homeTableView.rowHeight = UITableView.automaticDimension
        
        let defaultCellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(defaultCellNib, forCellReuseIdentifier: "HomeTableViewCell")
        let sliderCellNib = UINib(nibName: "SliderTableViewCell", bundle: nil)
        homeTableView.register(sliderCellNib, forCellReuseIdentifier: "SliderTableViewCell")
        let imagesCellNib = UINib(nibName: "ImagesTableViewCell", bundle: nil)
        homeTableView.register(imagesCellNib, forCellReuseIdentifier: "ImagesTableViewCell")
        
        newsAdapter.reloadData = reloadData
        print(newsAdapter.count())
       
    }
    
    func getMaterial(array: [Materials]) {
        newsAdapter.add(items: array)
        print(newsAdapter.count())
    }
    
    func getSlider(array: [Slider]) {
        newsAdapter.addSlider(items: array)
    }
    
    
    
    func getVideos(array: [Comics]) {
       newsAdapter.addVideos(items: array)
    }
    
    func getImages(array: [Comics]) {
       newsAdapter.addImages(items: array)
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
        case 1:     return newsAdapter.count()
        default:    return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: //Slider
            guard let  cell = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell") as? SliderTableViewCell else { fatalError() }
            cell.frame = tableView.bounds
            cell.layoutIfNeeded()
            var sliderArrayFromNewsAdapter = newsAdapter.getSliderArray()
            cell.configurTableViewCell(sliderArray: sliderArrayFromNewsAdapter)
            cell.sliderCollectionView.reloadData()
            return cell
            
        case 1://first cells
            let materialsObj = newsAdapter.getMaterialsObj(index: indexPath.row)
            if(materialsObj.type == "images"){
//                guard let  cell = tableView.dequeueReusableCell(withIdentifier: "ImagesTableViewCell") as? ImagesTableViewCell else { fatalError() }
                let cell : ImagesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImagesTableViewCell", for: indexPath) as! ImagesTableViewCell
                cell.frame = tableView.bounds
                cell.layoutIfNeeded()
                cell.imagesCollectionView.reloadData()
                //configure cell with event
                return cell
            }
            else{
                guard let  cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else { fatalError() }
                
                cell.configur(materials: materialsObj)
                return cell
          }
            
            
            
        
            
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
