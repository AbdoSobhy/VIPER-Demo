//
//  LeaugeInteractor.swift
//  VIPER-Demo
//
//  Created by Abdelrahman Sobhy on 1/3/21.
//  Copyright © 2021 Abdelrahman Sobhy. All rights reserved.
//

import Foundation

class LeaugeInteractor: LeaugeInteractorInput {
    var presenter: LeaugeInteractorOutput?
    var leaugeRepo = LeaugeRepoImpl()
    
    func getLeauge() {
        leaugeRepo.getLeauges { [weak self] response in
            switch response {
            case .success(let leauge):
                self?.presenter?.getLeaugeSuccess(leauge: leauge)
            case .failure(let error):
                self?.presenter?.getLeaugeFailure(error: error)
            }
            
        }
    }
    
}
