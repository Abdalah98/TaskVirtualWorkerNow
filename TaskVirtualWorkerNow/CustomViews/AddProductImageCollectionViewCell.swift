//
//  AddProductImageCollectionViewCell.swift
//  TaskVirtualWorkerNow
//
//  Created by Abdallah on 4/18/22.
//

import UIKit

class AddProductImageCollectionViewCell: UICollectionViewCell {
    var callBack:(()->())?
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var deletImage: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func deletImageAction(_ sender: Any) {
        callBack?()
  
    }
}
