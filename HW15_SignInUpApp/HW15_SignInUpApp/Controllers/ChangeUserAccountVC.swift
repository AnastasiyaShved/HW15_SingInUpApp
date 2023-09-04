//
//  ChangeUserAccountVC.swift
//  HW15_SignInUpApp
//
//  Created by Apple on 3.09.23.
//

import UIKit

class ChangeUserAccountVC: BaseViewController {

    //MARK: - property -
    @IBOutlet weak var newNameTF: UITextField!
    @IBOutlet weak var newEmailTF: UITextField!
    @IBOutlet weak var newPassFT: UITextField!
    @IBOutlet weak var newConfinmPassTF: UITextField!
    @IBOutlet weak var errorBadEmailLbl: UILabel!
    @IBOutlet weak var errorWeakPasswordLbl: UILabel!
    @IBOutlet weak var errorNotConfirmPassLbl: UILabel!
    
    //MARK: - private prorety -
    private var isValidNewEmail = false
    private var isValidNewPassword = false
    private var newPasswordStrength: PasswordStrength = .veryWeak
    private var isConfirnNewPassword = false
    
    //MARK: - actions -
    @IBAction func newEmailAction(_ sender: UITextField) {
        if let newEmail = sender.text,
           VerificationService.isValidEmail(email: newEmail) {
            isValidNewEmail = true
        } else {
            isValidNewEmail = false
        }
        errorBadEmailLbl.isHidden = isValidNewEmail
    }
    
    @IBAction func newPasswordAction(_ sender: UITextField) {
        if let newPassword = sender.text {
            newPasswordStrength = VerificationService.isValidPassword(pass: newPassword)
        } else {
            newPasswordStrength = .veryWeak
        }
        errorWeakPasswordLbl.isHidden = newPasswordStrength != .veryWeak
    }
    
    @IBAction func confirmPassAction(_ sender: UITextField) {
        if let confirmNewPass = sender.text,
           !confirmNewPass.isEmpty,
           let newpassword = newPassFT.text,
           !newpassword.isEmpty {
            isConfirnNewPassword = VerificationService.isPassConfirn(pass1: confirmNewPass, pass2: newpassword)
        } else {
            isConfirnNewPassword = false
        }
        errorNotConfirmPassLbl.isHidden = isConfirnNewPassword
    }
        
    @IBAction func saveNewDataAction(_ sender: UIButton) {
        guard var user = UserDefaultsService.getUserModel() else { return }
        if let newName = newNameTF.text, !newName.isEmpty {
            user.name = newName
        }

        if let newEmail = newEmailTF.text, !newEmail.isEmpty {
            user.email = newEmail
        }
        
        if let newPass = newPassFT.text, !newPass.isEmpty {
            user.pass = newPass
        }
        
        UserDefaultsService.saveUserModel(userModel: user)
        navigationController?.popViewController(animated: true)
    }
}
