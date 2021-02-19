//
//  LeaugeDetailsPresenter.swift
//  VIPER-Demo
//
//  Created by Abdelrahman Sobhy on 1/4/21.
//  Copyright © 2021 Abdelrahman Sobhy. All rights reserved.
//

import Foundation

class LeaugeDetailsPresenterImpl: LeaugeDetailsPresenter ,LeaugeDetailsOutputInteractor {
    weak var view: LeaugeDetailsView?
    private var interactor: LeaugeDetailsInputInteractor
    private var router: LeaugeDetailsRouter
    private var leaugeID: String
    
    init(view: LeaugeDetailsView, interactor: LeaugeDetailsInputInteractor, router: LeaugeDetailsRouter, leaugeID: String) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.leaugeID = leaugeID
    }
    
    func viewDidLoad() {
        view?.startAnimating()
        interactor.getLeauge(id: leaugeID)
        }
    
    func getLeaugeDetailsSuccess(leaugeDetails: LeagueData) {
        view?.stopAnimating()
        let leagueDetailsViewModel = LeagueDetailsViewModel(leagueData: leaugeDetails)
        self.view?.displayLeaugeData(viewModel: leagueDetailsViewModel)
    }
    
    func getLeaugeDetailsfailure(error: ErrorHandler) {
        view?.stopAnimating()
        router.showAlert(from: view , message: error.errorObject.message) { _ in
            self.view?.dismiss()
        }
        
    }

}
