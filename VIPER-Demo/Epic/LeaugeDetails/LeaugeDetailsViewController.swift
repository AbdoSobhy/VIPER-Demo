//
//  LeaugeDetailsViewController.swift
//  VIPER-Demo
//
//  Created by Abdelrahman Sobhy on 1/4/21.
//  Copyright © 2021 Abdelrahman Sobhy. All rights reserved.
//

import UIKit

class LeaugeDetailsViewController: UIViewController, LeaugeDetailsView {
    var presenter: LeaugeDetailsPresenter?
    
    @IBOutlet weak var LeaugeName: UILabel!
    @IBOutlet weak var leaugeDetails: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func displayLeaugeData(viewModel: LeagueDetailsViewModel) {
        self.LeaugeName.text = viewModel.leaugeName
        self.leaugeDetails.text = viewModel.leaugeDetails
    }

    func startAnimating() {
        self.showSpinner(onView: self.view)
    }
    
    func stopAnimating() {
        self.removeSpinner()
    }
    
    
    func showAlert(message: String, completion: ((UIAlertAction) -> Void)?) {
        self.alert(message: message, actions: [("OK", .cancel, completion)])
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }

}
