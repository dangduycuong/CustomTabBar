//
//  DetailGlassCell.swift
//  CustomTabBar
//
//  Created by Đặng Duy Cường on 1/6/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class DetailGlassCell: UITableViewCell {
    
    @IBOutlet weak var detailGlassImageView: UIImageView!
    @IBOutlet weak var strDrinkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var data: Drinks?

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData() {
        strDrinkLabel.text = data?.strDrink
        detailGlassImageView.dowloadFromServer(link: data?.strDrinkThumb ?? "")
    }

}
