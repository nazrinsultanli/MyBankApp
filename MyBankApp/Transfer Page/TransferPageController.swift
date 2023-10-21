//
//  TransferPageController.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 30.09.23.
//

import UIKit
import Lottie

class TransferPageController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fromCardTextField: UITextField!
    @IBOutlet weak var amountMoneyTextField: UITextField!
    @IBOutlet weak var toCardTextField: UITextField!
    
    @IBOutlet weak var amountErrorLabel: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var fromCardBalanceLabel: UILabel!
    
    @IBOutlet weak var lottieImageView: LottieAnimationView!
    var cardNumber: String?
    var users = UsersFromJson.shared.readUsers()

    var totalAmountOfFromCard = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountErrorLabel.isHidden = true
        totalAmountLabel.isHidden = true
        fromCardBalanceLabel.isHidden = true
        
        lottieImageView.play()
        lottieImageView.loopMode = .loop
        lottieImageView.contentMode = .scaleAspectFill
        
        title = "Transfer"

        fromCardTextField.text = cardNumber
        
      
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped(_:)))
        fromCardTextField.addGestureRecognizer(tapGesture)
        
        // Set the delegate to handle return key
        fromCardTextField.delegate = self
    }
    
    
    
    @objc func textFieldTapped(_ gesture: UITapGestureRecognizer) {
        // Handle tap on text field
        // Navigate to the second view controller here
        let controller = storyboard?.instantiateViewController(withIdentifier: "CardsPageController") as! CardsPageController
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    @IBAction func transferButtonClicked(_ sender: Any) {
        var cardAmount:Double = 0.0
        
        
        //let enteredToCard = toCardTextField.text ?? ""
        let enteredAmount = Double(amountMoneyTextField.text!) ?? 0
        
        if let indexCard = UsersFromJson.shared.returnCards().firstIndex(where: { $0.userCardNumber == cardNumber }){
            
            cardAmount = UsersFromJson.shared.returnCards()[indexCard].userCardAmount
        }

        
        if enteredAmount < cardAmount {
            totalAmountOfFromCard = cardAmount - enteredAmount
       
            
            
            if let index = users.firstIndex(where: { $0.userEmail == UsersFromJson.shared.emailSaved }) {
                //user = users[index]
                if let indexCard = users[index].userCardInfo.firstIndex(where: { $0.userCardNumber == cardNumber }){
                    users[index].userCardInfo[indexCard].userCardAmount = totalAmountOfFromCard
                }
            }
           
            UsersFromJson.shared.writeUsers(writeusers: users)

            
            totalAmountLabel.isHidden = false
            fromCardBalanceLabel.isHidden = false
            totalAmountLabel.text = "\(cardAmount)-\(enteredAmount)=\(totalAmountOfFromCard)"
        }
        else{
            amountErrorLabel.isHidden = false
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fromCardTextField.resignFirstResponder() // dismiss the keyboard
        return true
    }
    
}

