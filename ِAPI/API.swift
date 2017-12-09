//
//  API.swift
//  FoodsAppByAlamofireAndSwiftyJSON
//
//  Created by Shadi Matter on 12/6/17.
//  Copyright © 2017 Shadi Matter. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class API {
    class func FoodPhoto (completion:@escaping (_ error:Error? ,_ photo:[FoodsItems]?)->Void){
        
        let url = "http://swift3foodapp.alruabye.net/MobileWebService3.asmx/GetNewsNow?UserID=21153&StratFrom=1&EndTo=20&SubNesourceID=0&NewsID=0&Type=0&q=%40"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result
            {
            case .failure(let error):
                print(error)
                completion(error,nil)
         
            case .success(let value):
                let json = JSON(value)
                print(json)
                guard let data = json["newData"].array else{
                    completion(nil,nil)
                    return
                }
                
              var foodItem = [FoodsItems]()
                
                for food in data{
                    guard let food = food.dictionary , let foodData = FoodsItems.init(dict: food) else {
                        return}
                    foodItem.append(foodData)
                }
               completion(nil,foodItem)
            }
        }
        
    }
    
    
    class func FoodPhotos (completion:@escaping (_ error:Error?,_ photo:[FoodsItems]?)->Void){
        
        let url = "http://swift3foodapp.alruabye.net/MobileWebService3.asmx/GetNewsNow?UserID=21153&StratFrom=1&EndTo=20&SubNesourceID=0&NewsID=0&Type=0&q=%40"
        //        let parameters = [
        //            "UserID":21153,
        //            "StratFrom":1,
        //            "EndTo":20,
        //            "SubNesourceID":0,
        //            "NewsID":0,
        //            "Type":0,
        //            "q":0
        //        ]as? [String:Int]
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil    ).responseJSON { (response) in
            
            switch response.result
            {
            case .failure(let error):
                completion(error,nil)
                print(error)
            case .success(let value):
                
                let json = JSON(value)
                
                guard let photoArr = json["newData"].array else {
                    completion(nil,nil)
                    return
                }
                print(photoArr)
                var foodPhoto = [FoodsItems]()
                
//                for data in photoArr {
//
//                    guard let data = data.dictionary , let foodph = FoodsItems.init(dict: data)else{
//                        return
//                    }
//                    foodPhoto.append(foodph)
//                }
                
                
                photoArr.forEach({
                    if let dict = $0.dictionary , let photo = FoodsItems(dict: dict){
                        foodPhoto.append(photo)
                    }
                })
                completion(nil,foodPhoto)
            }
        }
        
    }
}

