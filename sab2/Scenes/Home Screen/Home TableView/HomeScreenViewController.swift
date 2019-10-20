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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        
        let defaultCellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(defaultCellNib, forCellReuseIdentifier: "HomeTableViewCell")
        let sliderCellNib = UINib(nibName: "SliderTableViewCell", bundle: nil)
        homeTableView.register(sliderCellNib, forCellReuseIdentifier: "SliderTableViewCell")
        
        // this is the full table
        
        materialObj.newsBlueLabel = "title"
        materialObj.postTitleLabel = "post"
        materialObj1.newsBlueLabel = "title1"
        materialObj1.postTitleLabel = "post1"
        
        materialObj2.newsBlueLabel = "title1"
        materialObj2.postTitleLabel = "post1"
        materialObj3.newsBlueLabel = "title1"
        materialObj3.postTitleLabel = "post1"
        PopulateTableData()
    }
    func PopulateTableData(){
        tableData.removeAll()
        tableData.append(StructTableSection(Header: "jjj", Cells: [materialObj,materialObj1], ShowHeader:false));
        tableData.append(StructTableSection(Header: "collection", Cells: [materialObj2,materialObj3], ShowHeader:false));

    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0){
            var  cell = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell")
            if cell == nil {
                cell = SliderTableViewCell.sliderTableViewCustomCell
              
                
            }
        
            var obj = tableData[indexPath.section].Cells[indexPath.row]
            
            
            return cell!
            
           
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
            var obj = tableData[indexPath.section].Cells[indexPath.row]
            cell.newsBlueLabel.text = obj.newsBlueLabel
            return cell
           
        }
        
        
    }
    
}
