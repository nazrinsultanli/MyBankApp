//
//  UsersFromJson.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 17.10.23.
//

import Foundation

class UsersFromJson {
    
    static let shared = UsersFromJson()
    var users = [UserData]()
    let helper = FileManagerHelper()
    let emailSaved = UserDefaults().string(forKey: "savedEmail")
    
    
    func readUsers() -> [UserData] {
        helper.readData { userItems in
            self.users = userItems
        }
        return users
    }
    
    func writeUsers(writeusers: [UserData]){
        helper.writeData(users: writeusers)
    }
    
    func returnCards () -> [UserCard]{
        var user: UserData?
        if let index = readUsers().firstIndex(where: { $0.userEmail == emailSaved }) {
            user = users[index]
        }
        return user?.userCardInfo ?? []
    }
    
//    func addCard (addcard: [UserCard]){
//        var userCards = [UserCard]()
//        userCards = returnCards()
//        userCards.append(addcard)
//    }
    
}
