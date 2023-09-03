//
//  AppVC.swift
//  HW15_SignInUpApp
//
//  Created by Apple on 3.09.23.
//

import UIKit

class AppVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupUI()
    }
    
    
    private func setupUI() {
        guard let name = UserDefaultsService.getUserModel()?.name,
              let email = UserDefaultsService.getUserModel()?.email
        else { return }
        
        nameLbl.text = name
        emailLbl.text = email
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
