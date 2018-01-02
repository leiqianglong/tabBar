//
//  MainTabBarController.swift
//  tabBar
//
//  Created by hou on 2017/12/30.
//  Copyright © 2017年 hou. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController,QRTabBarDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI() //初始化自己的子控制器
        setCustomTabBar()   //使用自定义tabbar
    }
    
    private func setUpUI(){
        
        let oneVC = UIViewController()
        oneVC.view.backgroundColor = UIColor.red
        let secVC = UIViewController()
        secVC.view.backgroundColor = UIColor.yellow
        let treVC = UIViewController()
        treVC.view.backgroundColor = UIColor.orange
        let fourVC = UIViewController()
        fourVC.view.backgroundColor = UIColor.gray
        
        
        //添加子控制器
        setUpChildViewController(childVC: oneVC, image: "btn_tabbar_home_normal_25x25_", selectImage: "btn_tabbar_home_selected_25x25_", title: "首页")
        setUpChildViewController(childVC: secVC, image: "btn_tabbar_lanmu_normal_25x25_", selectImage: "btn_tabbar_lanmu_selected_25x25_", title: "栏目")
        setUpChildViewController(childVC: fourVC, image: "btn_tabbar_zhibo_normal_25x25_", selectImage: "btn_tabbar_zhibo_selected_25x25_", title: "直播")
        setUpChildViewController(childVC: treVC, image: "btn_tabbar_wode_normal_25x25_", selectImage: "btn_tabbar_wode_selected_25x25_", title: "我的")

    }
    private func setCustomTabBar(){
     
        let tab = QRTabBar()
        tab.qrDelegate = self
        self.setValue(tab, forKeyPath: "tabBar")
    }
    //添加子控制器
    func setUpChildViewController(childVC : UIViewController,image:String,selectImage:String,title:String) {
        childVC.title = title
        childVC.tabBarItem.image = UIImage(named: image)
        childVC.tabBarItem.selectedImage = UIImage(named:selectImage)
        let nav = UINavigationController(rootViewController: childVC)
        addChildViewController(nav)
    }
    
   // MARK:-- QRTabBarDelegate
    func addButtonClickCall() {
        let vc = PopViewController()
        present(vc, animated: true, completion: nil)
    }

}
