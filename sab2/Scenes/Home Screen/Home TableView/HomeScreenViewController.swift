//
//  HomeScreenViewController.swift
//  sab2
//
//  Created by user on 10/17/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var homeTableView: UITableView!
    var materialObj = Material()
    var materialObj1 = Material()
    var materialObj2 = Material()
    var materialObj3 = Material()
    var tableData = [StructTableSection]()
        var networkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        homeTableView.rowHeight = UITableView.automaticDimension

        let defaultCellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(defaultCellNib, forCellReuseIdentifier: "HomeTableViewCell")
        let sliderCellNib = UINib(nibName: "SliderTableViewCell", bundle: nil)
        homeTableView.register(sliderCellNib, forCellReuseIdentifier: "SliderTableViewCell")

        materialObj.newsBlueLabel = "title"
        materialObj.postTitleLabel = "post"
        materialObj1.newsBlueLabel = "title1"
        materialObj1.postTitleLabel = "post1"
        materialObj2.newsBlueLabel = "title1"
        materialObj2.postTitleLabel = "post1"
        materialObj3.newsBlueLabel = "title1"
        materialObj3.postTitleLabel = "post1"
        PopulateTableData()
        
        
        
      
        getList(forPage: 1) { result in
                        switch result {
                        case .success(let apiResponse):
            
                            print(apiResponse)
                           // self.view?.getres(array: apiResponse as! [Person] )
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
        
        
    }
    
    
    
    
        func getList(forPage page: Int, compelation: @escaping (Result<Any, Error>) -> Void){
            networkManager.getSlider_MaterialResponse(pageNumber: page) { result,statusCode  in
                do {
                    let res = try result.get()

                    var personArray = res.slider
                    print("sliderrrrrrrrrr",res.slider)
                    compelation(.success(personArray) )
                }
                catch {
                    print(error.localizedDescription)
                    compelation(.failure(error))
                }
    
            }
    }
    
    
    func PopulateTableData(){
        tableData.removeAll()
        tableData.append(StructTableSection(Header: "jjj", Cells: [materialObj,materialObj1,materialObj2,materialObj3], ShowHeader:false));
        tableData.append(StructTableSection(Header: "collection", Cells: [materialObj2,materialObj3], ShowHeader:false));

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
        case 1:     return 2
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
            
            var obj = tableData[indexPath.section].Cells[indexPath.row]
            cell.newsBlueLabel.text = obj.newsBlueLabel
            return cell
            
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
   
}
