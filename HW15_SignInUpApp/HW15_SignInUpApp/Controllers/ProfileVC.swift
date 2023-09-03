//
//  ProfileVC.swift
//  HW15_SignInUpApp
//
//  Created by Apple on 31.08.23.
//

import UIKit

class ProfileVC: BaseViewController {

    
    
    @IBAction func deleteAccountAction() {
        UserDefaultsService.cleanUserDefoult()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func logOutAction() {
        navigationController?.popToRootViewController (animated: true)
    }
    
    
    }
    
