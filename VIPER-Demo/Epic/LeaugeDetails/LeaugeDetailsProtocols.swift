//
//  LeaugeDetailsProtocols.swift
//  VIPER-Demo
//
//  Created by Abdelrahman Sobhy on 1/4/21.
//  Copyright © 2021 Abdelrahman Sobhy. All rights reserved.
//

import UIKit

protocol LeaugeDetailsView: AnyObject {
    var presenter: LeaugeDetailsPresenter? { get set }
    func displayLeaugeData(viewModel: LeagueDetailsViewModel)
    func showAlert(message: String, completion: ((UIAlertAction) -> Void)?)
    func startAnimating()
    func stopAnimating()
    func dismiss()
}

protocol LeaugeDetailsPresenter: AnyObject {
    var view: LeaugeDetailsView? { get set }
    func viewDidLoad()
    
}

protocol LeaugeDetailsOutputInteractor {
    func getLeaugeDetailsSuccess(leaugeDetails: LeagueData)
    func getLeaugeDetailsfailure(error: ErrorHandler)

}

protocol LeaugeDetailsInputInteractor {
    var presenter: LeaugeDetailsOutputInteractor? {get set}
    func getLeauge(id: String)
}

protocol LeaugeDetailsRouter {
    static func createLeaugeDetailsModule(id: String) -> UIViewController
    static var storyboard: UIStoryboard {get}
}


