//
//  CardsPageController.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 30.09.23.
//

import UIKit
import Lottie


class CardsPageController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var lottieImageView: LottieAnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        lottieImageView.play()
        lottieImageView.loopMode = .loop
        lottieImageView.contentMode = .scaleAspectFill

        title = "Cards"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "LabelCell", bundle: nil), forCellReuseIdentifier: "LabelCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Refresh the card data here, if necessary
        tableView.reloadData() // Assuming your table view outlet is named tableView
        
    }

    @IBAction func addCardButtonClicked(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "AddCardPageController") as! AddCardPageController
        //5. set the delegate
        controller.delegate = self
        navigationController?.show(controller, sender: nil)
    }


}



extension  CardsPageController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UsersFromJson.shared.returnCards().count
        //return user?.userCardInfo.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let labelTableCell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelCell
        
        labelTableCell.setLabelInCell(labelTitle: UsersFromJson.shared.returnCards()[indexPath.row].userCardName )
        return labelTableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "TransferPageController") as! TransferPageController
        print(indexPath.row)
//        controller.cardRowNumberFromCardPage = indexPath.row
        controller.cardNumber = UsersFromJson.shared.returnCards()[indexPath.row].userCardNumber
        navigationController?.show(controller, sender: nil)
    }
    

}

//// 5. final
extension CardsPageController: AddCardDelegate{
    func didAddNewCard() {
        tableView.reloadData()
    }
}
