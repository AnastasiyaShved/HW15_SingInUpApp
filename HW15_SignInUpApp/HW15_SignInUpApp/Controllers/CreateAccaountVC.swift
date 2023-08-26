//
//  CreateAccaountVC.swift
//  HW15_SignInUpApp
//
//  Created by Apple on 25.08.23.
//

import UIKit

class CreateAccaountVC: BaseViewController {

    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var errorEmailLbl: UILabel!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorPassLbl: UILabel!
    
    
    @IBOutlet var strongPasswordIndView: [UIView]!
    
    @IBOutlet weak var comfirnPasswordTF: UITextField!
    @IBOutlet weak var errorConfirnPasswordLbl: UILabel!

    @IBOutlet weak var continueBtn: UIButton!

    @IBOutlet weak var scrolView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strongPasswordIndView.forEach { view in
            view.alpha = 0.2
        }
        hideKeyboardWhenTappedAround()
        startKeyboardObserver()
    }
    
    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        
        scrolView.contentInset = contentInsets
        scrolView.scrollIndicatorInsets = contentInsets
    }
        
    @objc private func keyboardWillHide() {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
            scrolView.contentInset = contentInsets
            scrolView.scrollIndicatorInsets = contentInsets
        }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            guard let destVC = segue.destination as? VerificationsVC,
//                  let userModel = sender as? UserModel else { return }
//            destVC.userModel = userModel
//        }
}
