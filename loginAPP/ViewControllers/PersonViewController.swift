//
//  PersonViewController.swift
//  loginAPP
//
//  Created by Павел Цыганов on 30.10.2021.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet var aboutMe: UILabel!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMe.text = "\(user.person.aboutMe)"
        navigationItem.title = "\(user.person.fullName)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutVC = segue.destination as? AboutMeViewController else { return }
        aboutVC.user = user
    }

}
