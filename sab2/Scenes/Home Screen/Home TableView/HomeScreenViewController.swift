//
//  HomeScreenViewController.swift
//  sab2
//
//  Created by user on 10/17/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class HomeScreenViewController: BaseViewController<ListPresenter>,
ListViewProtocal {
    
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
        
        // datasource and delegate in adapter
        self.homeTableView.delegate = newsAdapter
        self.homeTableView.dataSource = newsAdapter
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
    
    func setMaterial(array: [Materials]) {
        newsAdapter.add(items: array)
    }
    
    func setSlider(array: [Slider]) {
        newsAdapter.addSlider(items: array)
    }
    
    func setVideos(array: [Comics]) {
        newsAdapter.addVideos(items: array)
    }
    
    func setImages(array: [Comics]) {
        newsAdapter.addImages(items: array)
    }
    func setArticles(array: [Materials]) {
        newsAdapter.addArticles(items: array)
    }
    
    func reloadData() {
        homeTableView.reloadData()
    }

    override func setPresenter(presenter: ListPresenter) {
        listPresenter = presenter
    }
    
}
