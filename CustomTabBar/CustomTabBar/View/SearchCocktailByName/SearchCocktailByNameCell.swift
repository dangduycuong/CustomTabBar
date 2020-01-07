//
//  SearchCocktailByNameCell.swift
//  CustomTabBar
//
//  Created by Đặng Duy Cường on 1/6/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class SearchCocktailByNameCell: UITableViewCell {
    
    @IBOutlet weak var strCategoryLabel: UILabel!
    @IBOutlet weak var strDrinkLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    
    var data: Drinks?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData() {
        strCategoryLabel.text = data?.strCategory
        strDrinkLabel.text = data?.strDrink
        detailImageView.dowloadFromServer(link: data?.strDrinkThumb ?? "")
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    static var identifier: String {
        return "SearchCocktailByNameCell"
    }
}
