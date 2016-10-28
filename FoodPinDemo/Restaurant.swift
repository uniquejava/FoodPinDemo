//
//  Restaurant.swift
//  FoodPinDemo
//
//  Created by cyper on 29/10/2016.
//  Copyright © 2016 cyper tech. All rights reserved.
//

import Foundation

class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}
