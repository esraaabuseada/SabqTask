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
        homeTableView.rowHeight = UITableView.automaticDimension
        
//        let header = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
//        header.backgroundColor = .red
//
//        self.homeTableView.tableHeaderView = header
        
        
        let defaultCellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(defaultCellNib, forCellReuseIdentifier: "HomeTableViewCell")
        let sliderCellNib = UINib(nibName: "SliderTableViewCell", bundle: nil)
        homeTableView.register(sliderCellNib, forCellReuseIdentifier: "SliderTableViewCell")
        
//        let headerNib = UINib.init(nibName: "SliderTableViewCell", bundle: Bundle.main)
//        homeTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "SliderTableViewCell")
        
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
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
            var obj = tableData[indexPath.section].Cells[indexPath.row]
            cell.newsBlueLabel.text = obj.newsBlueLabel
            return cell
            
            
        default:
            return UITableViewCell()
        }
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        //        var obj = tableData[indexPath.section].Cells[indexPath.row]
        //        cell.newsBlueLabel.text = obj.newsBlueLabel
        //        return cell
        
        //        if (indexPath.section == 0){
        //            var  cell = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell")
        //            if cell == nil {
        //                cell = SliderTableViewCell.sliderTableViewCustomCell
        //
        //
        //            }
        //
        //            var obj = tableData[indexPath.section].Cells[indexPath.row]
        //
        //
        //            return cell!
        //
        //
        //        }
        //        else{
        //
        //
        //        }
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SliderTableViewCell") as! SliderTableViewCell
        
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
   
}
