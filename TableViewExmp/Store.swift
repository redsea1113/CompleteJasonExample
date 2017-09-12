//
//  Store.swift
//  TableViewExmp
//
//  Created by Ali Farhat on 4/11/15.
//  Copyright (c) 2015 ali farhat. All rights reserved.
//

import UIKit

class Store: NSObject {
    
    var storeName:String
    var storeDesc:String
    var storePhone:String
    var storeLat:Float
    var storeLng:Float
    var storeImageName:String
    
    var storeImage:Data = Data()

    
    
    
    override init() {
        
        storeName = ""
        storeDesc = ""
        storeImageName = ""
        storePhone = ""
        storeLat = 0.0
        storeLng = 0.0
        
    }
    
    init(name:String, desc:String, phone:String, lat:Float, lng:Float, image:String)
    {
        storeName = name
        storeDesc = desc
        storeImageName = image
        storePhone = phone
        storeLat = lat
        storeLng = lng
    }

   
}
