//
//  HomeVC.swift
//  TaskVirtualWorkerNow
//
//  Created by Abdallah on 4/19/22.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var mealroductCollectionView: UICollectionView!
    @IBOutlet weak var itemTypeCollectionView: UICollectionView!
    @IBOutlet weak var productDataCollectionView: UICollectionView!
    var articles = [Product]()
    var mealArry = ["Breakfast","Dinner","Desserts"]
    var itemTyprArray = ["Plates","Hot Drinks","Iced Coffee"]
    var productarra = [Item(name: "dd", info: "dd", image: "Mask Group 3"),
                       Item(name: "dd", info: "dd", image: "Mask Group 3"),
                       Item(name: "dd", info: "dd", image: "Mask Group 3"),
                       Item(name: "dd", info: "dd", image: "Mask Group 3"),
                       Item(name: "dd", info: "dd", image: "Mask Group 3"),
                       Item(name: "dd", info: "dd", image: "Mask Group 3"),
                       Item(name: "dd", info: "dd", image: "Mask Group 3"),
    ]
    var slectIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealroductCollectionView.delegate = self
        mealroductCollectionView.dataSource = self
        itemTypeCollectionView.delegate = self
        itemTypeCollectionView.dataSource = self
        productDataCollectionView.delegate = self
        productDataCollectionView.dataSource = self
        configureCollection()
        featchPersistenceData()
    }
    
    
    //  featchPersistenceData()

    func featchPersistenceData(){
        PersistenceManger.retrieveSaved { [weak self]result in
            guard let self = self else{return}
            switch result{
            case .success(let favoites):
                if favoites.isEmpty {
                    self.showAlert(withTitle: "", withMessage: "No Favorite?\nAdd one on the News screen " )
                }
                else{
                    self.articles = favoites
//                    favoites.forEach { (pro) in
//                        print(pro.Price)
//                        print(pro.image)
//                        print(pro.itemType)
//                        print(pro.meal)
//                        print(pro.productInfo)

                //    }
                }
                
            case .failure(let error):
                self.showAlert(withTitle: "Some thing worng!", withMessage: error.rawValue)
            }
        }
    }
    
    
}
