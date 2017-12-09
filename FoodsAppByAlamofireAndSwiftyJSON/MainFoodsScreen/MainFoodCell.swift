//
//  MainFoodCell.swift
//  FoodsAppByAlamofireAndSwiftyJSON
//
//  Created by Shadi Matter on 12/6/17.
//  Copyright © 2017 Shadi Matter. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

import Kingfisher

class MainFoodCell: UICollectionViewCell {

    @IBOutlet weak var ImageNameLA: UILabel!
    // @IBOutlet weak var ImageName: UILabel!
    @IBOutlet weak var IV: UIImageView!
//    var photo:FoodsItems? {
//        didSet{
//            guard let photo = photo else {return}
//            IV.image = #imageLiteral(resourceName: "gg")
//
//
//            Alamofire.request(photo.url).response { response in
//                if let data = response.data , let image = UIImage(data: data){
//                    self.IV.image = image
//                    print(photo.url)
//                }
//            }
//        }
//    }
    var photo:FoodsItems?{
        
        didSet{
            guard let photo = photo else{return}
            IV.image = #imageLiteral(resourceName: "gg")
            
            // Download Image By Alamofire
     /*       Alamofire.request(photo.url).response { response in
                if let data =   response.data , let image = UIImage(data: data){
                    self.IV.image = image
                    print(photo.url)
            }
        }
 */
            // Download Image By KingFisher
        self.IV.kf.indicatorType = .activity
            if let url = URL(string: photo.url){
                self.IV.kf.setImage(with: url, placeholder: nil, options:nil, progressBlock: nil, completionHandler: nil)
            }
ImageNameLA.text = photo.FoodName
        }
    }
}
