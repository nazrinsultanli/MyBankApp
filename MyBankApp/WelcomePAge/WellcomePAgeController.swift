//
//  WellcomePAgeController.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 30.09.23.
//

import UIKit

enum HomeItems: String, CaseIterable {
    case cards = "Cards"
    case transfer = "Transfer"
    case profile = "Profile"
}

class WellcomePAgeController: UIViewController{

    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var animationY: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wellcome"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "LabelCell", bundle: nil), forCellReuseIdentifier: "LabelCell")
        
        
     
   
        startAnimation()
        
    }
    
    
    func startAnimation() {
        UIView.animate(withDuration: 1, animations: {
            self.animationView.layer.cornerRadius = 50
        }) { _ in
            UIView.animate(withDuration: 1, animations: {
                self.animationY.constant = -20
                self.view.layoutIfNeeded()
            }) { _ in
                UIView.animate(withDuration: 1, animations: {
                    self.animationY.constant = 120
                    self.view.layoutIfNeeded()
                }) { _ in
                    // Call the startAnimation function again to repeat the sequence
                    self.startAnimation()
                }
            }
        }
    }



    
    
    
    
}


extension  WellcomePAgeController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HomeItems.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let labelTableCell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelCell
        labelTableCell.setLabelInCell(labelTitle: HomeItems.allCases[indexPath.row].rawValue)
        return labelTableCell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch(HomeItems.allCases[indexPath.row]) {
        case .cards:
            let controller = storyboard?.instantiateViewController(withIdentifier:"CardsPageController") as! CardsPageController
            navigationController?.show(controller, sender: nil)
            
        case .transfer:
            let controller = storyboard?.instantiateViewController(withIdentifier:"TransferPageController") as! TransferPageController
            navigationController?.show(controller, sender: nil)
            
        case .profile:
            let controller = storyboard?.instantiateViewController(withIdentifier:"ProfilePageController") as! ProfilePageController
            navigationController?.show(controller, sender: nil)
        }
    }
}
