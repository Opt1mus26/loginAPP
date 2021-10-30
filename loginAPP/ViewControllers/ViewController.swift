//
//  ViewController.swift
//  loginAPP
//
//  Created by Павел Цыганов on 26.10.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var loginOutlet: UITextField!
    @IBOutlet var passwordOutlet: UITextField!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginOutlet.delegate = self
        loginOutlet.returnKeyType = .next
        
        passwordOutlet.delegate = self
        passwordOutlet.returnKeyType = .done
        
        passwordOutlet.isEnabled = true
        passwordOutlet.enablesReturnKeyAutomatically = true
    }
    
    @IBAction func forgotUserNameAction() {
        showAlert(title: "Oops!", message: "Your name is User")
    }
    
    @IBAction func forgotPasswordAction() {
        showAlert(title: "Oops!", message: "Your password is Password")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let personVC = navigationVC.topViewController as! PersonViewController
                personVC.user = user
            }
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginOutlet.text = ""
        passwordOutlet.text = ""
    }
    
    @IBAction func logInButton() {
        guard loginOutlet.text == user.login else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password"); return }
        guard passwordOutlet.text == user.password else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password"); return }
    }
}

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAktion = UIAlertAction(title: "OK", style: .default) { _ in self.passwordOutlet.text = ""
        }
        alert.addAction(okAktion)
        present(alert, animated: true)
    }
}

extension ViewController: UITextViewDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginOutlet {
            passwordOutlet.resignFirstResponder()
        } else {
            logInButton()
            performSegue(withIdentifier: "dvc", sender: nil)
        }
        return true
    }
}
