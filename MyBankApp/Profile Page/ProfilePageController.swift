//
//  ProfilePageController.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 30.09.23.
//

import UIKit
import Lottie

class ProfilePageController: UIViewController {
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    
    @IBOutlet weak var lottieImageView: LottieAnimationView!
    var users = UsersFromJson.shared.readUsers()
    var cardNumbers = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        lottieImageView.play()
        lottieImageView.loopMode = .loop
        lottieImageView.contentMode = .scaleAspectFill
        title = "Profile"
  
        
        if let index = users.firstIndex(where: { $0.userEmail == UsersFromJson.shared.emailSaved }) {
            let user = users[index]
            self.fullNameLabel.text = user.userFullName
            self.passwordLabel.text = user.userPassword
            self.emailLabel.text = user.userEmail
            
            for i in 0..<UsersFromJson.shared.returnCards().count{
                cardNumbers += "\(UsersFromJson.shared.returnCards()[i].userCardNumber)\n"
            }
            cardNumberLabel.text = cardNumbers
            
            
            
        }
 
    }
    

}
