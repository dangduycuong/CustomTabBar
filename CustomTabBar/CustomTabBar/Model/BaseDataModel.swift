//
//  GlassesModel.swift
//  CustomTabBar
//
//  Created by Đặng Duy Cường on 1/6/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

struct BaseDataModel: Codable {
    var drinks: [Drinks]?
}

struct Drinks: Codable {
    var strGlass: String?
    var strCategory: String?
    
    // detail
    var strDrink: String?
    var strDrinkThumb: String?
    var idDrink: String?
    
    // serach by name
    var strTags: String?
    var strInstructions: String?
}

struct ImageModel: Codable {
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
}
