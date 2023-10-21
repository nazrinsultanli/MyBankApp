//
//  AddCardPageController.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 01.10.23.
//

import UIKit
import Lottie

//1 create delegate protocol
protocol AddCardDelegate: AnyObject {
    func didAddNewCard()
}

class AddCardPageController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var cardNameTextField: UITextField!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var expireDateTextField: UITextField!
    @IBOutlet weak var cvcTextField: UITextField!
    
    @IBOutlet weak var lottieImageView: LottieAnimationView!
    @IBOutlet weak var cardNumberErrorLabel: UILabel!
  
    var users = UsersFromJson.shared.readUsers()
  
    
    //2 add delegate property
    weak var delegate: AddCardDelegate?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Card"
        lottieImageView.play()
        lottieImageView.loopMode = .loop
        lottieImageView.contentMode = .scaleAspectFill
        
        cardNumberErrorLabel.isHidden = true
       
        //cardNumberTextField.delegate = self
        
        
        
    }

    @IBAction func createButtonClicked(_ sender: Any) {
        let cardNameEntered = cardNameTextField.text ?? ""
        var cardNumberEntered = ""
        if cardNumberTextField.text?.count == 16 {
            cardNumberEntered = cardNumberTextField.text ?? ""
        }
        else {
            cardNumberErrorLabel.isHidden = false
        }
        let enteredExpireDate = expireDateTextField.text ?? ""
        let enteredCvcTextField = cvcTextField.text ?? ""
        
        let newCard = UserCard(userCardName: cardNameEntered, userCardNumber: cardNumberEntered, userCardExpireDate: enteredExpireDate, userCardCVC: enteredCvcTextField, userCardAmount: 100, userCardCurrency: "Euro")
  
       
        if let index = users.firstIndex(where: { $0.userEmail == UsersFromJson.shared.emailSaved }) {
            
            users[index].userCardInfo.append(newCard)
            
        }

       
        UsersFromJson.shared.writeUsers(writeusers: users)
        print("-----users after write in add card----")
        print(users)
        
        //3 notify delegate when a new card is added
        delegate?.didAddNewCard()
     
        cardNumberErrorLabel.isHidden = true
        navigationController?.popViewController(animated: true)
        
       
        
    }
    

}



