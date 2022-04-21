//
//  ProductDataCollectionViewCell.swift
//  TaskVirtualWorkerNow
//
//  Created by Abdallah on 4/19/22.
//

import UIKit

class ProductDataCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
     }

    func set(data:Item){
        productImage.image = UIImage(named: data.image)
        productNameLabel.text = data.name
        infoLabel.text  = data.info
    }
}

