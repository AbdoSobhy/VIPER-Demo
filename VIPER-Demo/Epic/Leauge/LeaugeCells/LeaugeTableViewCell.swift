//
//  LeaugeTableViewCell.swift
//  VIPER-Demo
//
//  Created by Abdelrahman Sobhy on 1/3/21.
//  Copyright © 2021 Abdelrahman Sobhy. All rights reserved.
//

import UIKit

class LeaugeTableViewCell: UITableViewCell, LeaugeCell {
    @IBOutlet weak var leaugeName: UILabel!
    @IBOutlet weak var leaugeAltName: UILabel!
    @IBOutlet weak var leaugeSport: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    private func display(name: String) {
        self.leaugeName.text = name
    }
    
    private func display(altName: String) {
        self.leaugeAltName.text = altName
    }
    
    private func display(sport: String) {
        self.leaugeSport.text = sport
    }
    
    func configure(viewModel: LeaugeViewModel) {
        display(name: viewModel.leaugeName)
        display(altName: viewModel.leaugeAltirnitiveName)
        display(sport: viewModel.leaugeSport)
    }


}
