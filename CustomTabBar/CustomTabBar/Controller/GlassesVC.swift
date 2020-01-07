//
//  GlassesVC.swift
//  CustomTabBar
//
//  Created by Đặng Duy Cường on 1/6/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class GlassesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    //set before
    var isButtonHidden: Bool = true
    let WIDTH_SCREEN = UIScreen.main.bounds.width
    let numberOfItems: CGFloat = 3
    let padding: CGFloat = 1
    
    var drinks: [Drinks]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/list.php")!
        let finalURL = url.appendingParams("g", value: "list")
        
        BaseRouter.shared.callAPI(url: finalURL) { (data: BaseDataModel) in
            self.drinks = data.drinks
            self.collectionView.reloadData()
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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinks == nil ? 0 : drinks!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GlassesCell", for: indexPath) as! GlassesCell
        cell.strGlassLabel.text = drinks![indexPath.row].strGlass
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailGlassVC = storyboard?.instantiateViewController(withIdentifier: "DetailGlassVC") as! DetailGlassVC
        detailGlassVC.dataFilter = drinks![indexPath.row]
        detailGlassVC.typeFilter = .glasses
        present(detailGlassVC, animated: true, completion: nil)
    }
}

extension GlassesVC: UICollectionViewDelegateFlowLayout {
    // Size of Item
    
    //set before
    //    var isButtonHidden: Bool = true
    //    let WIDTH_SCREEN = UIScreen.main.bounds.width
    //    let numberOfItems: CGFloat = 3
    //    let padding: CGFloat = 1
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (WIDTH_SCREEN - padding * 2 - padding * (numberOfItems - 1))/numberOfItems
        return CGSize(width: itemSize, height: itemSize)
    }
    
    // Spacing Between Each Edge Of Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0)
    }
    
    // Spacing Between Rows Of Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    //    Spacing Between Colums Of Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
}
