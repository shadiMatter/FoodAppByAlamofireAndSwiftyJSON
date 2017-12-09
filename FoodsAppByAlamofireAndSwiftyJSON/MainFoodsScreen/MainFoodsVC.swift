//
//  ViewController.swift
//  FoodsAppByAlamofireAndSwiftyJSON
//
//  Created by Shadi Matter on 12/6/17.
//  Copyright © 2017 Shadi Matter. All rights reserved.
//

import UIKit
import Alamofire

class MainFoodsVC: UIViewController {

    var foodsArr = [FoodsItems]()
  fileprivate let  cellIdentifire = "MainFoodCell"
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.backgroundColor = .clear
        view.backgroundColor = .white
      
      
        
        collectionView.dataSource = self
      collectionView.delegate = self
        
        collectionView.register(UINib.init(nibName: cellIdentifire, bundle: nil), forCellWithReuseIdentifier: cellIdentifire)

        handleRefresh()
        
    }

    func handleRefresh(){
        API.FoodPhotos { (error:Error?, foods:[FoodsItems]?) in
            if let foods = foods {
                    self.foodsArr = foods
                self.collectionView.reloadData()
                
        }
    
    }
    }


}

extension MainFoodsVC:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  foodsArr.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifire, for: indexPath) as? MainFoodCell else {return UICollectionViewCell()}
        cell.photo =  foodsArr[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    performSegue(withIdentifier: "showDetails", sender: foodsArr[indexPath.row])
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distenation = segue.destination as? FoodDetailsVC{
            if let food = sender as? FoodsItems {
                distenation.singleItem = food
            }
        }
    }
}

extension MainFoodsVC:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        var width = (screenWidth-30)/2
        width = width>200 ? 200 : width
        
        return CGSize(width: width, height: width)
        
    }
    
}

