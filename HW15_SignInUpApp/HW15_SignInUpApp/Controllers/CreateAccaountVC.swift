//
//  CreateAccaountVC.swift
//  HW15_SignInUpApp
//
//  Created by Apple on 25.08.23.
//

import UIKit

class CreateAccaountVC: BaseViewController {

    //MARK: - Property -
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

    //MARK: - private prorety -
    private var isValidEmail = false { didSet {updateContinieBtnState() } }
    private var isConfirnPassword = false { didSet {updateContinieBtnState() } }
    private var passwordStrength: PasswordStrength = .veryWeak { didSet {updateContinieBtnState() } }
    private var secureBtnState = false
    
    private var confirnPassSecureBtnState = false
    
    //MARK: - life circle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strongPasswordIndView.forEach { view in
            view.alpha = 0.2
        }
        hideKeyboardWhenTappedAround()
        startKeyboardObserver()
    }
    
    //MARK: - actions -
    @IBAction func emailTextField(_ sender: UITextField) {
        if let email = sender.text,
           !email.isEmpty,
           VerificationService.isValidEmail(email: email){
            isValidEmail = true
        } else {
            isValidEmail = false
           
        }
        errorEmailLbl.isHidden = isValidEmail
    }
    
    @IBAction func passwordTextField(_ sender: UITextField) {
        if let passText = sender.text,
           !passText.isEmpty {
            passwordStrength = VerificationService.isValidPassword(pass: passText)
        } else {
            passwordStrength = .veryWeak
        }
        errorPassLbl.isHidden = passwordStrength != .veryWeak
        setupStrongIndicatorsView()
    }
    
    @IBAction func confirnPasswordTextField(_ sender: UITextField) {
        if let confirnPassWordTex = sender.text,
           !confirnPassWordTex.isEmpty,
           let passwordText = passwordTF.text,
           !passwordText.isEmpty {
            isConfirnPassword = VerificationService.isPassConfirn(pass1: confirnPassWordTex, pass2: passwordText)
        } else {
            isConfirnPassword = false
        }
        errorConfirnPasswordLbl.isHidden = isConfirnPassword
    }
    
    @IBAction func tabSecureBtn(_ sender: UIButton) {
        passwordTF.isSecureTextEntry = secureBtnState
        secureBtnState.toggle()
    }
    
    @IBAction func tabConfinrSecureBtn(_ sender: UIButton) {
        comfirnPasswordTF.isSecureTextEntry = confirnPassSecureBtnState
        confirnPassSecureBtnState.toggle()
    }
    
// не работает возврат по  кнопке
    @IBAction func signInAction() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func continueAct() {
        if let email = emailTF.text,
           let pass = passwordTF.text {
            let userModel = UserModel(name: nameTF.text, email: email, pass: pass)
            
        }
    }
    
    
    //MARK: - private funcs -
    private func setupStrongIndicatorsView() {
        strongPasswordIndView.enumerated().forEach { index, view in
            if index <= (passwordStrength.rawValue - 1) {
                view.alpha = 1
            } else {
                view.alpha = 0.2
            }

        }
    }
    
    private func updateContinieBtnState() {
        continueBtn.isEnabled = isValidEmail && isConfirnPassword && passwordStrength  != .veryWeak
    }
    
    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification  , object: nil)
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
