//
//  UserDataManager.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 30.09.23.
//

import Foundation

class UserDataManager {
    static let shared = UserDataManager()
    
//    var userIDCopy = 0
//    var userNumber = 0
    var userDataArray = [UserData(userID:11111,
                                  userFullName: "Nazrin Dolkhanova",
                                  userEmail: "coach.nazrin@gmail.com",
                                  userPhoneNumber: "0998000859",
                                  userPassword: "anamanam",
                                  userCardInfo:[
                                    UserCard(userCardName: "Salary1",
                                             userCardNumber: "1010101010101010",
                                             userCardExpireDate: "01.02.2024",
                                             userCardCVC: "111",
                                             userCardAmount: 10000,
                                             userCardCurrency: "Dollar"),
                                    UserCard(userCardName: "Salary2",
                                             userCardNumber: "1010101010101010",
                                             userCardExpireDate: "01.02.2024",
                                             userCardCVC: "111",
                                             userCardAmount: 10000,
                                             userCardCurrency: "Dollar"),
                                    UserCard(userCardName: "Salary3",
                                             userCardNumber: "1010101010101010",
                                             userCardExpireDate: "01.02.2024",
                                             userCardCVC: "111",
                                             userCardAmount: 10000,
                                             userCardCurrency: "Dollar")
                                  ]
                                 ),
                         UserData(userID:22222,
                                  userFullName: "Nazka Sultashka",
                                  userEmail: "1",
                                  userPhoneNumber: "0998000859",
                                  userPassword: "1",
                                  userCardInfo:[
                                    UserCard(userCardName: "Salary",
                                             userCardNumber: "1010101010101011",
                                             userCardExpireDate: "01.02.2024",
                                             userCardCVC: "111",
                                             userCardAmount: 10000,
                                             userCardCurrency: "Dollar"),
                                    
                                    UserCard(userCardName: "Kredit",
                                             userCardNumber: "1111111111111111",
                                             userCardExpireDate: "01.02.2024",
                                             userCardCVC: "111",
                                             userCardAmount: 10000,
                                             userCardCurrency: "Dollar")
                                  ]
                                 )
    ]
    
}
