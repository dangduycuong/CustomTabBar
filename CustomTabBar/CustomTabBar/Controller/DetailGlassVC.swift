//
//  DetailGlassVC.swift
//  CustomTabBar
//
//  Created by Đặng Duy Cường on 1/6/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

enum TypeFilter: String {
    case categories, glasses, ingredients, alcoholic
}

class DetailGlassVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var strGlassLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var typeFilter = TypeFilter.categories
    
    var detailStrGlass: String?
    var drinks: [Drinks]?
    var dataFilter: Drinks?

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromAPI()
    }
    
    func getDataFromAPI() {
        var titleVC: String?
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php")!
        var finalURL: URL?
        switch typeFilter {
        case .categories:
            titleVC = dataFilter?.strCategory
            finalURL = url.appendingParams("c", value: dataFilter?.strCategory ?? "")
        case .glasses:
            titleVC = dataFilter?.strGlass
            finalURL = url.appendingParams("g", value: dataFilter?.strGlass ?? "")
        default:
            break
        }
        strGlassLabel.text = titleVC
        BaseRouter.shared.callAPI(url: finalURL) { (data: BaseDataModel) in
            self.drinks = data.drinks
            self.tableView.reloadData()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks == nil ? 0 : drinks!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailGlassCell", for: indexPath) as! DetailGlassCell
        cell.data = drinks![indexPath.row]
        cell.fillData()
        
        return cell
    }
    
    
    @IBAction func closedAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

