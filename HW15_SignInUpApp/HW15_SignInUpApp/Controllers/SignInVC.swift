//
//  SignInVC.swift
//  HW15_SignInUpApp
//
//  Created by Apple on 24.08.23.
//

import UIKit

class SignInVC: BaseViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorLbl: UILabel! {
        didSet { errorLbl.isHidden = true }
    }
    @IBOutlet weak var signBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = UserDefaultsService.getUserModel() {
            goToTabBarController()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func signInAction() {
        errorLbl.isHidden = true
        guard let email = emailTF.text,
              let pass = passwordTF.text,
              let userModel = UserDefaultsService.getUserModel(),
              email == userModel.email,
              pass == userModel.pass
        else {
            errorLbl.isHidden = false
            return
        }
        goToTabBarController()
    }
    
    private func goToTabBarController() {
        let storyboard = UIStoryboard(name: "MainStoryboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController
        else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
    
    
    
    

