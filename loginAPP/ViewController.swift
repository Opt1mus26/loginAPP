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
        guard let dvc = segue.destination as? WelcomeViewController else { return }
        dvc.login = loginOutlet.text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginOutlet.text = ""
        passwordOutlet.text = ""
    }
    
    @IBAction func logInButton() {
        let loginTF = "User"
        let passwordTF = "Password"
        guard loginOutlet.text == loginTF else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password"); return }
        guard passwordOutlet.text == passwordTF else {
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
