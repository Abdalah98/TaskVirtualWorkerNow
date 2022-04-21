//
//  HomeCollectionView+EXT.swift
//  TaskVirtualWorkerNow
//
//  Created by Abdallah on 4/21/22.
//

import UIKit
extension HomeVC :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
        func configureCollection(){
            let nib = UINib(nibName: "ProductDataCollectionViewCell", bundle: nil)
            productDataCollectionView.register(nib, forCellWithReuseIdentifier: "ProductDataCollectionViewCell")
        }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mealroductCollectionView {
            return mealArry.count
        }
        else if collectionView == itemTypeCollectionView {
        return itemTyprArray.count
        }
        return productarra.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mealroductCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealCollectionViewCell", for: indexPath) as! MealCollectionViewCell
            cell.mealnameLabel.text = mealArry[indexPath.item]
            return cell
            
        }
        else if collectionView == itemTypeCollectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemTypeCollectionViewCell", for: indexPath) as! ItemTypeCollectionViewCell
        cell.itemNameLabel.text = itemTyprArray[indexPath.item]
        
        return cell
        
           }
        
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDataCollectionViewCell", for: indexPath) as! ProductDataCollectionViewCell
       cell.set(data:  productarra[indexPath.item])
        
        return cell
        
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if collectionView == mealroductCollectionView {

                return CGSize(width: 120 , height:collectionView.frame.height)
            }else if collectionView == itemTypeCollectionView {
                return CGSize(width: 120, height:collectionView.frame.height)

            }
            return CGSize(width: 200 , height:200)

            }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mealroductCollectionView {
            if slectIndex != nil{
               
                let selectCell = collectionView.cellForItem(at:slectIndex! ) as! MealCollectionViewCell
                selectCell.view.backgroundColor = UIColor.white
                selectCell.mealnameLabel.textColor = UIColor.black
            }
            slectIndex = indexPath
            let selectCell = collectionView.cellForItem(at:slectIndex! ) as! MealCollectionViewCell
            selectCell.view.backgroundColor = UIColor.red
            selectCell.mealnameLabel.textColor = UIColor.white
        }else if collectionView == itemTypeCollectionView {
            if slectIndex != nil{
                let selectCell = collectionView.cellForItem(at:slectIndex! ) as! ItemTypeCollectionViewCell
                selectCell.itemNameLabel.textColor = UIColor.lightGray
            }
            slectIndex = indexPath
            let selectCell = collectionView.cellForItem(at:slectIndex! ) as! ItemTypeCollectionViewCell
            selectCell.itemNameLabel.textColor = UIColor.black
        }
    }
    
}
