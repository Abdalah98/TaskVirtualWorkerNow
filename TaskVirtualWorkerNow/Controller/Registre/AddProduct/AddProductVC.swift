//
//  AddProductVC.swift
//  TaskVirtualWorkerNow
//
//  Created by Abdallah on 4/18/22.
//

import UIKit

class AddProductVC: UIViewController {
    @IBOutlet weak var productnameText: UITextField!
    @IBOutlet weak var productInfoText: UITextField!
    @IBOutlet weak var mealText: UITextField!
    @IBOutlet weak var itemtypeText: UITextField!
    @IBOutlet weak var priceText: UITextField!

    @IBOutlet weak var addProductImage: UIButton!
    @IBOutlet weak var collectionViewImageProduct: UICollectionView!

    var imagePicker = UIImagePickerController()
     var image: [UIImage] = []
    override func viewDidLoad() {
    super.viewDidLoad()
     
     imagePicker.delegate = self
        configureCollection()
     }


    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)

    }

    // MARK: Action Button

   
    @IBAction func addProductImageAction(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
     }
    @IBAction func signInAction(_ sender: Any) {
     //   saveInPersistenceFavorite()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Home", bundle:nil)
                 let resultViewController = storyBoard.instantiateViewController(withIdentifier: "Home") as! TabBarController
                  self.navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    
    
    func saveInPersistenceFavorite(){
        let encodedImages = image.compactMap({ $0.pngData()?.base64EncodedString() })
        let product = Product(productName:productnameText.text ?? "" , productInfo: productInfoText.text ?? "" , meal: mealText.text ?? "", itemType: itemtypeText.text ?? "", Price: priceText.text ?? "", image:encodedImages)
        PersistenceManger.updateWith(favorite: product, actionType: .add) { [weak self] error in
            guard let self = self else {return}
            guard let error = error else{
                
                self.showAlert(withTitle: "Success!", withMessage: "You have successfully locatData  🎉")
                let storyBoard : UIStoryboard = UIStoryboard(name: "Home", bundle:nil)
                         let resultViewController = storyBoard.instantiateViewController(withIdentifier: "Home") as! TabBarController
                          self.navigationController?.pushViewController(resultViewController, animated: true)
                 return
            }
            self.showAlert(withTitle: "Some thing worng!", withMessage: error.rawValue)
            
        }
    }
    
    
  
    
}

//MARK: - extension PikerImageController
extension AddProductVC:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func openGallary() {
         imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
         imagePicker.allowsEditing = true
         self.present(imagePicker, animated: true, completion: nil)
     }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        guard let editImage = info[.originalImage] as? UIImage else { return  }
        self.image.append(editImage)
        self.collectionViewImageProduct.reloadData()

        dismiss(animated: true, completion: nil)
    }
}

