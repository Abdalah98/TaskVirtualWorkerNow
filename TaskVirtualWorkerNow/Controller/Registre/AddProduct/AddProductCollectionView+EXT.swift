//
//  AddProductCollectionView+EXT.swift
//  TaskVirtualWorkerNow
//
//  Created by Abdallah on 4/18/22.
//

import UIKit
extension AddProductVC :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func configureCollection(){
        let nib = UINib(nibName: "AddProductImageCollectionViewCell", bundle: nil)
        collectionViewImageProduct.register(nib, forCellWithReuseIdentifier: "AddProductImageCollectionViewCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddProductImageCollectionViewCell", for: indexPath) as! AddProductImageCollectionViewCell
        cell.imageProduct.image = image[indexPath.item]
        
        
        cell.callBack = {
            //alret
            let alretController = UIAlertController(title: "Do you Need Remove image?", message: nil, preferredStyle: .actionSheet)
            alretController.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (_) in
                self.image.remove(at: indexPath.item)
                self.collectionViewImageProduct.reloadData()
            }))
            
            alretController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alretController, animated: true)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height:100)
    }
    
    
}
