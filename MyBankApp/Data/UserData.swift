//
//  UserData.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 30.09.23.
//

import Foundation

struct UserData: Codable{
    var userID: Int
    var userFullName: String
    var userEmail: String
    var userPhoneNumber: String
    var userPassword: String
    var userCardInfo: [UserCard]
}

struct UserCard: Codable {
    var userCardName: String
    var userCardNumber: String
    var userCardExpireDate: String
    var userCardCVC: String
    var userCardAmount: Double
    var userCardCurrency: String
    
}
