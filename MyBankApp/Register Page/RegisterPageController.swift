//
//  RegisterPageController.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 30.09.23.
//

import UIKit
import Lottie

class RegisterPageController: UIViewController {

    
    @IBOutlet weak var newFullNameTextField: UITextField!
    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var newPhoneNumberTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!

    @IBOutlet weak var lottieImageView: LottieAnimationView!
    var users = [UserData]()
    //let helper = FileManagerHelper()
    
  
    
    //--1--
    var registerButtonClickedCallBackLogin: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        
        lottieImageView.play()
        lottieImageView.loopMode = .loop
        lottieImageView.contentMode = .scaleAspectFill
        
//        helper.readData {userItems in
//            self.users = userItems
//        }

        users = UsersFromJson.shared.readUsers()

    }
    

    
    @IBAction func registerButtonClicked(_ sender: Any) {
        // data entering process
        let enteredFullName = newFullNameTextField.text ?? ""
        let enteredEmail = newEmailTextField.text ?? ""
        let enteredPhoneNumber = newPhoneNumberTextField.text ?? ""
        let enteredPassword = newPasswordTextField.text ?? ""
        
        let newUser = UserData(userID: Int.random(in: 1..<10000),
                               userFullName: enteredFullName,
                               userEmail: enteredEmail,
                               userPhoneNumber: enteredPhoneNumber,
                               userPassword: enteredPassword,
                               userCardInfo: [])
        
        users.append(newUser)
        
        //--2--
        registerButtonClickedCallBackLogin?(enteredEmail, enteredPassword)
        //helper.writeData(users: users)
        UsersFromJson.shared.writeUsers(writeusers: users)
        navigationController?.popViewController(animated: true)
    }
    
}
