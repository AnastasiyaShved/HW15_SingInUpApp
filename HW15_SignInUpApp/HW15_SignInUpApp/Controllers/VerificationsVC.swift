//
//  VerificationsVC.swift
//  HW15_SignInUpApp
//
//  Created by Apple on 29.08.23.
//

import UIKit

class VerificationsVC: BaseViewController {

    var userModel: UserModel?
    let randomInt = Int.random(in: 100000 ... 999999)
    
  
    
    @IBOutlet weak var InfoTextLbl: UILabel!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var errorCodeLbl: UILabel!
    @IBOutlet weak var cenetrConstraint: NSLayoutConstraint!
    
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
        hideKeyboardWhenTappedAround()
        startKeyboardObserver()
    }
    
    
    
    @IBAction func codeTFAction(_ sender: UITextField) {
        errorCodeLbl.isHidden = true
        guard let text = sender.text, !text.isEmpty, text == randomInt.description else {
            errorCodeLbl.isHidden = false
            return
        }
    }
    
    
    
    private func startKeyboardObserver() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        @objc private func keyboardWillShow(notification: Notification) {
            guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
            cenetrConstraint.constant -= keyboardSize.height / 2
        }
        
        @objc private func keyboardWillHide(notification: Notification) {
            guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
            cenetrConstraint.constant += keyboardSize.height / 2
        }
    
    
    private func setupUI() {
        InfoTextLbl.text =  "Please enter code '\(randomInt)' from \(userModel?.email ?? "")"
    }
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
