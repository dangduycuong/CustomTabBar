//
//  ViewController.swift
//  CustomTabBar
//
//  Created by Đặng Duy Cường on 1/6/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class CustomTabbarVC: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet var arrayButton: [UIButton]!
    
    var categoriesVC: UIViewController!
    var glassesVC: UIViewController!
    var searchCocktailByNameVC: UIViewController!
    var trendingViewController: UIViewController!
    var jsonplaceholderVC: UIViewController!
    
    var viewControllers: [UIViewController]!
    
    var selectedIndex: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        categoriesVC = storyboard.instantiateViewController(withIdentifier: "CategoriesVC")
        glassesVC = storyboard.instantiateViewController(withIdentifier: "GlassesVC")
        searchCocktailByNameVC = storyboard.instantiateViewController(withIdentifier: "SearchCocktailByNameVC")
        trendingViewController = storyboard.instantiateViewController(withIdentifier: "CategoriesVC")
        categoriesVC = storyboard.instantiateViewController(withIdentifier: "CategoriesVC")
        jsonplaceholderVC = storyboard.instantiateViewController(withIdentifier: "JsonplaceholderVC")
        
        
        viewControllers = [categoriesVC, glassesVC, searchCocktailByNameVC, trendingViewController, jsonplaceholderVC]
        defaultVC()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func defaultVC() {
        let previousIndex = selectedIndex
        
        arrayButton[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        
        // Remove the previous ViewController
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        let vc = viewControllers[0]
        
        // Add the new ViewController. (Calls the viewWillAppear method of the ViewController you are adding)
        
        addChild(vc)
        
        // Adjust the size of the ViewController view you are adding to match the contentView of your tabBarViewController and add it as a subView of the contentView.
        
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
    }

    @IBAction func didPressTab(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        arrayButton[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        
        // Remove the previous ViewController
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        
        // Add the new ViewController. (Calls the viewWillAppear method of the ViewController you are adding)
        
        addChild(vc)
        
        // Adjust the size of the ViewController view you are adding to match the contentView of your tabBarViewController and add it as a subView of the contentView.
        
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
    }
}

