//
//  WelcomeViewController.swift
//  loginAPP
//
//  Created by Павел Цыганов on 26.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

  
    @IBOutlet var wellcomeOutlet: UILabel!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        wellcomeOutlet.text = "Wellcome, \(user.person.fullName)"
        
    }
   
    
}
