//
//  LeaugeDetailsInteractor.swift
//  VIPER-Demo
//
//  Created by Abdelrahman Sobhy on 1/4/21.
//  Copyright © 2021 Abdelrahman Sobhy. All rights reserved.
//

import Foundation

class LeaugeDetailsInteractor: LeaugeDetailsInputInteractor {
    var presenter: LeaugeDetailsOutputInteractor?
    var repo = LeaugeRepoImpl()
    
    func getLeauge(id: String){
        repo.getLeaugeDetails(id: id) { [weak self] response in
            switch response {
            case .success(let leagueDetails):
                if let leaugeData = leagueDetails.leagues.first {
                    self?.presenter?.getLeaugeDetailsSuccess(leaugeDetails: leaugeData)
                }
            case .failure(let error):
                self?.presenter?.getLeaugeDetailsfailure(error: error)
            }
        }
    }
}
