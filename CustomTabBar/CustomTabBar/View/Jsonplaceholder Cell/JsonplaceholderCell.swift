//
//  JsonplaceholderCell.swift
//  CustomTabBar
//
//  Created by Đặng Duy Cường on 1/7/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class JsonplaceholderCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailUrlImageView: UIImageView!
    
    var data: ImageModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var identifier: String {
        return "JsonplaceholderCell"
    }
    
    static func nib() -> UINib {
        return UINib(nibName: JsonplaceholderCell.identifier, bundle: nil)
    }
    
    func fillData() {
        titleLabel.text = data?.title
        // đổ ảnh, cách 1
        thumbnailUrlImageView.dowloadFromServer(link: data?.thumbnailUrl ?? "")
        // đổ ảnh, cách 2
//        if let thumbnailUrl = URL(string: data?.thumbnailUrl ?? "") {
//            let data = try! Data(contentsOf: thumbnailUrl)
//            thumbnailUrlImageView.image = UIImage(data: data)
//        }
    }
}
