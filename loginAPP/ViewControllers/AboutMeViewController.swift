//
//  AboutMeViewController.swift
//  loginAPP
//
//  Created by Павел Цыганов on 30.10.2021.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var aboutMe: UILabel!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMe.text = "\(user.person.hobby)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? NextViewController else { return }
        nextVC.user = user
    }

}
