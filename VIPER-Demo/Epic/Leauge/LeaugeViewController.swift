//
//  LeaugeViewController.swift
//  VIPER-Demo
//
//  Created by Abdelrahman Sobhy on 1/3/21.
//  Copyright © 2021 Abdelrahman Sobhy. All rights reserved.
//

import UIKit

class LeaugeViewController: UIViewController, LeaugeView {
    var presenter: LeaugePresenter?
    
    @IBOutlet weak var leaugeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        presenter?.viewDidLoad()
    }

    
    func startAnimating() {
        self.showSpinner(onView: self.view)
    }
    
    func stopAnimating() {
        self.removeSpinner()
    }
    
    func reloadData() {
        self.leaugeTableView.reloadData()
    }
    
    func showAlert(message: String) {
        self.alert(message: message, actions: [("OK", .cancel)])
    }

}

extension LeaugeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(LeaugeTableViewCell.self)") as? LeaugeTableViewCell else { return LeaugeTableViewCell() }
        presenter?.confugerCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    
}

