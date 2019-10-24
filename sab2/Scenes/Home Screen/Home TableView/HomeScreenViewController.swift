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
        let nav = self.navigationController?.navigationBar
        let logImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 44, height: 27))
       logImageView.contentMode = .scaleAspectFit
        
        let rightImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 17, height: 21))
        rightImageView.contentMode = .scaleAspectFit
        
       
        let logoImage = UIImage(named: "logo")
        logImageView.image = logoImage
        
        let rightImage = UIBarButtonItem(image: UIImage(named:"notification-icon"), style: .plain, target: self, action: Selector("noaction"))
        
       // rightImageView.image = rightImage
        
        // 5
        navigationItem.titleView = logImageView
        navigationItem.rightBarButtonItem = rightImage
        
        
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
        let videosCellNib = UINib(nibName: "VideosTableViewCell", bundle: nil)
        homeTableView.register(videosCellNib, forCellReuseIdentifier:"VideosTableViewCell")
        
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
                let cell : ImagesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImagesTableViewCell", for: indexPath) as! ImagesTableViewCell
                cell.frame = tableView.bounds
                cell.layoutIfNeeded()
                var imagesArrayFromNewsAdapter = newsAdapter.getImagesArray()
                cell.configurTableViewCell(imagesArray: imagesArrayFromNewsAdapter)
                cell.imagesCollectionView.reloadData()
            
                return cell
            } else  if(materialsObj.type == "videos"){
                let cell : VideosTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VideosTableViewCell", for: indexPath) as! VideosTableViewCell
                cell.frame = tableView.bounds
                cell.layoutIfNeeded()
                var videosArrayFromNewsAdapter = newsAdapter.getVideosArray()
                cell.configurTableViewCell(videosArray: videosArrayFromNewsAdapter)
                cell.videosCollectionView.reloadData()
                
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
