//
//  TabBarViewController.swift
//  sab2
//
//  Created by user on 10/17/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTabBar()
    }
    

    func setupTabBar(){
        let homeViewController = createNaveController(vc: HomeScreenViewController(), selected: #imageLiteral(resourceName: "ic_newspaper_active"), unselected: #imageLiteral(resourceName: "ic_newspaper"))
        let details = createNaveController(vc: DetailsScreenViewController(), selected: #imageLiteral(resourceName: "ic_search_active"), unselected: #imageLiteral(resourceName: "ic_search"))
        viewControllers = [homeViewController , details]
        
        guard let items = tabBar . items else {return}
        
        for item in items{
           item.imageInsets =  UIEdgeInsets(top: 4,left: 0,bottom: -4,right: 0)
        }
    }
    

}
extension UITabBarController{
    func createNaveController(vc:UIViewController ,selected: UIImage, unselected: UIImage) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selected
        return navController
    }
    
}
