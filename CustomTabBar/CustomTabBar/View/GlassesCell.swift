//
//  GlassesCell.swift
//  CustomTabBar
//
//  Created by Đặng Duy Cường on 1/6/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class GlassesCell: UICollectionViewCell {
    @IBOutlet weak var strGlassLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    static var identifier: String {
        return self.identifier
    }
}
