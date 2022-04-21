//
//  SignInVC.swift
//  TaskVirtualWorkerNow
//
//  Created by Abdallah on 4/18/22.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    // MARK: Action Button
    @IBAction func recoveryPasswordAction(_ sender: Any) {
        if usernameText.text!.isEmpty && passwordText.text!.isEmpty {
            showAlert(withTitle: "Please fill all fields", withMessage: "Ok")
        }else{
            showAlert(withTitle: "Login successfuly logged", withMessage: "Done")
        }
    }
    @IBAction func signInAction(_ sender: Any) {
    }
    @IBAction func registerAction(_ sender: Any) {
    }
}
