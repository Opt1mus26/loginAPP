//
//  WelcomeViewController.swift
//  loginAPP
//
//  Created by Павел Цыганов on 26.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    var login: String?
    @IBOutlet var wellcomeOutlet: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let login = self.login else { return }
        wellcomeOutlet.text = "Wellcome, \(login)!"
    }
   
    
}
