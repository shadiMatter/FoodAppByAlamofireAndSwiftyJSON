
//
//  FoodsItems.swift
//  FoodsAppByAlamofireAndSwiftyJSON
//
//  Created by Shadi Matter on 12/6/17.
//  Copyright © 2017 Shadi Matter. All rights reserved.
//

import Foundation
import SwiftyJSON
//import Kingfisher

class FoodsItems:NSObject{
    
    var id:Int
    var FoodName:String
    var url:String
    var SubNesourceName:String
    init?(dict:[String:JSON]){
        guard let id = dict["NewsID"]?.toInt , let url = dict["PicturLink"]?.string else {return nil}
        self.id = id
        self.FoodName = dict["NewsTitle"]?.string ?? "Food"
        self.SubNesourceName = dict["SubNesourceName"]?.string ?? "الوجبات "
        self.url = url
    }
}

