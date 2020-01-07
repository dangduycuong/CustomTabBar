//
//  JsonplaceholderVC.swift
//  CustomTabBar
//
//  Created by Đặng Duy Cường on 1/7/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class JsonplaceholderVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var images: [ImageModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.register(JsonplaceholderCell.nib(), forCellReuseIdentifier: JsonplaceholderCell.identifier)
        getData()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func getData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
        
        BaseRouter.shared.callAPI(url: url!) { (data: [ImageModel]) in
            self.images = data
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images == nil ? 0 : images!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JsonplaceholderCell.identifier, for: indexPath) as! JsonplaceholderCell
        cell.data = images![indexPath.row]
        cell.fillData()
        return cell
    }
}
