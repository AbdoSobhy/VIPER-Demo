//
//  LeaugePresenter.swift
//  VIPER-Demo
//
//  Created by Abdelrahman Sobhy on 1/3/21.
//  Copyright © 2021 Abdelrahman Sobhy. All rights reserved.
//

import Foundation

class LeaugePresenterImpl: LeaugePresenter, LeaugeInteractorOutput {
    
    weak var view: LeaugeView?
    private let interactor: LeaugeInteractorInput
    private let router: LeaugeRouter
    var leauge = [Leagues]()
    var numberOfRows: Int {
        leauge.count
    }
    
    
    init(view: LeaugeView, interactor: LeaugeInteractorInput, router: LeaugeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.startAnimating()
        interactor.getLeauge()
    }
    
    func getLeaugeSuccess(leauge: League) {
        self.view?.stopAnimating()
        self.leauge.append(contentsOf: leauge.leagues)
        self.view?.reloadData()
    }
    
    func getLeaugeFailure(error: ErrorHandler) {
        self.view?.stopAnimating()
        // handle error
        router.showAlert(from: view, message: error.errorObject.message)
    }
    
    func confugerCell(cell: LeaugeCell, indexPath: IndexPath) {
        let viewModel = LeaugeViewModel(leagues: self.leauge[indexPath.row])
        cell.configure(viewModel: viewModel)
    }
    
    func didSelectRowAt(indexPath: IndexPath){
        if let leaugeId = leauge[indexPath.row].idLeague {
            router.navigateToDetailsScreen(from: view, id: leaugeId)
        }
    }
    
}
