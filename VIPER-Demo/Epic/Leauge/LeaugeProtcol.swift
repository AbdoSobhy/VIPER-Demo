//
//  LeaugeProtcol.swift
//  VIPER-Demo
//
//  Created by Abdelrahman Sobhy on 1/3/21.
//  Copyright © 2021 Abdelrahman Sobhy. All rights reserved.
//

import Foundation

protocol LeaugeView: AnyObject {
    var presenter: LeaugePresenter? { get set }
    func startAnimating()
    func stopAnimating()
    func reloadData()
}

protocol LeaugeCell: AnyObject {
    func configure(viewModel: LeaugeViewModel)
}


protocol LeaugePresenter: AnyObject {
    var view: LeaugeView? { get set }
    var numberOfRows: Int { get }
    func confugerCell(cell: LeaugeCell, indexPath: IndexPath)
    func viewDidLoad()
    func didSelectRowAt(indexPath: IndexPath)
}

protocol LeaugeInteractorInput {
    var presenter: LeaugeInteractorOutput? { get set }
    func getLeauge()
}

protocol LeaugeInteractorOutput {
    func getLeaugeSuccess(leauge: League)
    func getLeaugeFailure(error: ErrorHandler)
}

protocol LeaugeRouter {
    func navigateToDetailsScreen(from view: LeaugeView?, id: String)
    func showAlert(from view: LeaugeView?, message: String)
}


