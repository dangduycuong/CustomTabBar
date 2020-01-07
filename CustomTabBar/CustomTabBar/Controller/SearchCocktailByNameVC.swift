//
//  SearchCocktailByNameVC.swift
//  CustomTabBar
//
//  Created by Đặng Duy Cường on 1/6/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class SearchCocktailByNameVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var drinks: [Drinks]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(SearchCocktailByNameCell.nib(), forCellReuseIdentifier: SearchCocktailByNameCell.identifier)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getData(_ s: String) {
//        https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a

        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php")
        let finalURL = url?.appendingParams("s", value: s)
        
        BaseRouter.shared.callAPI(url: finalURL!) { (data: BaseDataModel) in
            self.drinks = data.drinks
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks == nil ? 0 : drinks!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCocktailByNameCell.identifier, for: indexPath) as! SearchCocktailByNameCell
        cell.data = drinks![indexPath.row]
        cell.fillData()
        return cell
    }
    
    @IBAction func onClickToSearch(_ sender: UIButton) {
        let s = searchBar.text ?? ""
        getData(s)
    }
}
