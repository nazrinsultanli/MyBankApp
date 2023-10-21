//
//  LoginPageController.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 30.09.23.
//

import UIKit
import Lottie

class LoginPageController: UIViewController{
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var errorLoginLabel: UILabel!
    
    @IBOutlet weak var bankLogom: LottieAnimationView!
    var users = [UserData]()
    //let helper = FileManagerHelper()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLoginLabel.isHidden = true
        userEmail.layer.cornerRadius = userEmail.frame.size.height/2
        userEmail.layer.masksToBounds = true
        userEmail.layer.borderWidth = 0.5
        
        userPassword.layer.cornerRadius = userPassword.frame.size.height/2
        userPassword.layer.masksToBounds = true
        userPassword.layer.borderWidth = 0.5
        
        LoginButton.layer.cornerRadius = LoginButton.frame.size.height/2
        LoginButton.layer.masksToBounds = true
        //LoginButton.layer.borderWidth = 0.5
        
        bankLogom.play()
        bankLogom.loopMode = .loop
        bankLogom.contentMode = .scaleAspectFill
     
    }
    

    
    // evvelden gelib update etsin deye
    override func viewWillAppear(_ animated: Bool) {
        users = UsersFromJson.shared.readUsers()
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        let enteredEmail = userEmail.text
        let enteredPassword = userPassword.text
        
        UserDefaults.standard.setValue(true, forKey: "LoggedIn")
        UserDefaults.standard.setValue(enteredEmail, forKey: "savedEmail")
        
        if users.contains(where: {$0.userEmail ==  enteredEmail && $0.userPassword == enteredPassword}){
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.setMainRootViewController(windowScene: windowScene)
            }
        }
        else{
            errorLoginLabel.isHidden = false
            errorLoginLabel.text = "Yanlish login"
        }
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {

        let registerPage = storyboard?.instantiateViewController(withIdentifier: "RegisterPageController") as! RegisterPageController
        
        //--3--- burada cagirmaq
        registerPage.registerButtonClickedCallBackLogin = { a, b in

            self.userEmail?.text = a
            self.userPassword?.text = b
            
        }
        navigationController?.show(registerPage, sender: nil)
    }
    
}

extension LoginPageController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder() // tek ishletsen, hansi textfielde bassan acilirbaglanir
        errorLoginLabel.isHidden = true
        if textField == userEmail {
            userPassword.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }

}
