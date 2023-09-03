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
    
    
    //MARK: - life circle -
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
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
        guard let newName = newNameTF.text,
              let newEmail = newEmailTF.text,
              let newPass = newPassFT.text
        else { return }
        
        let newUserData = UserModel(name: newName, email: newEmail, pass: newPass)
        UserDefaultsService.saveUserModel(userModel: newUserData)
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - private funcs -
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
