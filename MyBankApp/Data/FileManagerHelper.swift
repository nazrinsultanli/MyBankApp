//
//  FileManagerHelper.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 14.10.23.
//

import Foundation

class FileManagerHelper{
    
    func getFilePath() -> URL{
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent("users.json")
        
        print(path)
        return path
    }
    
    func readData(complete:( ([UserData]) -> Void )  ) {
        if let data = try? Data(contentsOf: getFilePath()){
            do {
                let items = try JSONDecoder().decode([UserData].self, from: data)
                complete(items)
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func writeData(users: [UserData]){
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to:getFilePath())
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
