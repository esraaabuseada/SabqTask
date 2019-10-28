//
//  HomeScreenViewController.swift
//  sab2
//
//  Created by user on 10/17/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class HomeScreenViewController: BaseViewController<ListPresenter>,
    ListViewProtocal,
    UITableViewDelegate,
UITableViewDataSource {
    
    @IBOutlet weak private var homeTableView: UITableView!
    var listPresenter: ListPresenter?
    var newsAdapter = NewsAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = self.navigationController?.navigationBar
        titleNavigationBarItem()
        leftNavigationBarItem()
        rightNavigationBarItem()
        
        listPresenter?.loadMaterial()
        listPresenter?.loadSlider()
        listPresenter?.loadVideos()
        listPresenter?.loadImage()
        listPresenter?.loadArticles()
        
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        
        // datasource and delegate in adapter
        //        self.homeTableView.delegate = newsAdapter
        //        self.homeTableView.dataSource = newsAdapter
        registerCells()
        homeTableView.rowHeight = UITableView.automaticDimension
        newsAdapter.reloadData = reloadData
    }
    
    func titleNavigationBarItem() {
        let logImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 44, height: 27))
        logImageView.contentMode = .scaleAspectFit
        let logoImage = #imageLiteral(resourceName: "logo")
        logImageView.image = logoImage
        navigationItem.titleView = logImageView
    }
    
    func leftNavigationBarItem() {
        let containView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        imageview.image = #imageLiteral(resourceName: "user")
        imageview.contentMode = UIView.ContentMode.scaleAspectFit
        imageview.layer.cornerRadius = 20
        imageview.layer.masksToBounds = true
        containView.addSubview(imageview)
        let leftBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "user"),
                                            style: .plain, target: self,
                                            action: nil)
        leftBarButton.tintColor = .red
        self.navigationItem.leftBarButtonItem = leftBarButton
        
    }
    
    func rightNavigationBarItem() {
        let containView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: 21))
        _ = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: 21))
        let notificationIconImageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 17, height: 21))
        notificationIconImageview.image = #imageLiteral(resourceName: "notification-icon")
        notificationIconImageview.contentMode = UIView.ContentMode.scaleAspectFit
        notificationIconImageview.layer.cornerRadius = 10
        notificationIconImageview.layer.masksToBounds = true
        containView.addSubview( notificationIconImageview)
        let rightBarButton = UIBarButtonItem(customView: containView)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func registerCells() {
        let defaultCellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(defaultCellNib, forCellReuseIdentifier: "HomeTableViewCell")
        let sliderCellNib = UINib(nibName: "SliderTableViewCell", bundle: nil)
        homeTableView.register(sliderCellNib, forCellReuseIdentifier: "SliderTableViewCell")
        let imagesCellNib = UINib(nibName: "ImagesTableViewCell", bundle: nil)
        homeTableView.register(imagesCellNib, forCellReuseIdentifier: "ImagesTableViewCell")
        let videosCellNib = UINib(nibName: "VideosTableViewCell", bundle: nil)
        homeTableView.register(videosCellNib, forCellReuseIdentifier: "VideosTableViewCell")
        let articlesCellNib = UINib(nibName: "ArticlesTableViewCell", bundle: nil)
        homeTableView.register(articlesCellNib, forCellReuseIdentifier: "ArticlesTableViewCell")
    }
    
    func getMaterial(array: [Materials]) {
        newsAdapter.add(items: array)
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
    func getArticles(array: [Materials]) {
        newsAdapter.addArticles(items: array)
    }
    
    func reloadData() {
        homeTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            
        case 0:     return 400
        case 1:
            var materialArrayFromAdapter = newsAdapter.getMaterialsArray()
            if (materialArrayFromAdapter[indexPath.row].type == "images") {
                return 347
            } else if (materialArrayFromAdapter[indexPath.row].type == "videos") {
                return 349
            } else if (materialArrayFromAdapter[indexPath.row].type == "articles") {
                return 370
            } else { return 150 }
            
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
            guard let  cell = tableView.dequeueReusableCell(
                withIdentifier: "SliderTableViewCell")
            as? SliderTableViewCell else { fatalError("slider cell empty") }
            cell.frame = tableView.bounds
            cell.layoutIfNeeded()
            let sliderArrayFromNewsAdapter = newsAdapter.getSliderArray()
            cell.configurTableViewCell(sliderArray: sliderArrayFromNewsAdapter)
            cell.reloadCollectionView()
            return cell
        case 1://first cells
            let materialsObj = newsAdapter.getMaterialsObj(index: indexPath.row)
            if(materialsObj.type == "images") {
              guard  let cell: ImagesTableViewCell = tableView.dequeueReusableCell(
                withIdentifier: "ImagesTableViewCell",
                for: indexPath) as? ImagesTableViewCell else { fatalError("image cell empty") }
                cell.frame = tableView.bounds
                cell.layoutIfNeeded()
                let imagesArrayFromNewsAdapter = newsAdapter.getImagesArray()
                cell.configurTableViewCell(imagesArray: imagesArrayFromNewsAdapter)
                cell.reloadCollectionView()
                return cell
            } else  if(materialsObj.type == "videos") {
               guard let cell: VideosTableViewCell = tableView.dequeueReusableCell(
                withIdentifier: "VideosTableViewCell",
                for: indexPath) as? VideosTableViewCell else { fatalError("videos cell empty") }
                cell.frame = tableView.bounds
                cell.layoutIfNeeded()
                let videosArrayFromNewsAdapter = newsAdapter.getVideosArray()
                cell.configurTableViewCell(videosArray: videosArrayFromNewsAdapter)
                cell.reloadCollectionView()
                return cell
            } else  if(materialsObj.type == "articles") {
              guard  let cell: ArticlesTableViewCell = tableView.dequeueReusableCell(
                withIdentifier: "ArticlesTableViewCell",
                for: indexPath) as? ArticlesTableViewCell else { fatalError("articles cell empty") }
                cell.frame = tableView.bounds
                cell.layoutIfNeeded()
                let articlesArrayFromNewsAdapter = newsAdapter.getArticlesArray()
                cell.configurTableViewCell(articlesArray: articlesArrayFromNewsAdapter)
                cell.reloadCollectionView()
                return cell
            } else {
                guard let  cell = tableView.dequeueReusableCell(
                    withIdentifier: "HomeTableViewCell",
                    for: indexPath) as? HomeTableViewCell else { fatalError("home cell empty") }
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
