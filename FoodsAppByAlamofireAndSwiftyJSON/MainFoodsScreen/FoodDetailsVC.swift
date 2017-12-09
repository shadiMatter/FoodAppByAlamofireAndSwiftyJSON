//
//  FoodDetailsVC.swift
//  FoodsAppByAlamofireAndSwiftyJSON
//
//  Created by Shadi Matter on 12/6/17.
//  Copyright © 2017 Shadi Matter. All rights reserved.
//

import UIKit
import Alamofire

class FoodDetailsVC: UIViewController {
    
    @IBOutlet weak var descTX: UITextView!
    @IBOutlet weak var nameLA: UILabel!
    var singleItem:FoodsItems?
    @IBOutlet weak var FoodImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

       /*
 
         laName2.text = SingleItem?.Name
         laDesc2.text =  SingleItem?.Desc
         // laImage2.image = UIImage(named: (SingleItem?.Image)!
         
        */
//         let imageUrl = URL(string: (singleItem?.url)!)
//         let data =  try! Data(contentsOf: imageUrl!)
//         FoodImg.image = UIImage(data: data)
//
  // FoodDetals.text = singleItem?.FoodName
    
        
//        guard   let imageURl = URL(string: (singleItem?.url)!) else {return}
//         let data = try! Data(contentsOf: imageURl)
//            FoodImg.image = UIImage(data: data)
    
        
        Alamofire.request((singleItem?.url)!).response { response in
            if let data =   response.data , let image = UIImage(data: data){
                self.FoodImg.image = image
                //print(photo.url)
            }
        }
        nameLA.text = singleItem?.SubNesourceName
        descTX.text = singleItem?.FoodName
        
    }


}
