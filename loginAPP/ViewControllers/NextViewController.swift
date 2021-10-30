//
//  NextViewController.swift
//  loginAPP
//
//  Created by Павел Цыганов on 30.10.2021.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet var nextOutlet: UILabel!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextOutlet.text = "\(user.person.meatingOfLife)"

    }
    

    
}
