//
//  LeaugeRouter.swift
//  VIPER-Demo
//
//  Created by Abdelrahman Sobhy on 1/3/21.
//  Copyright © 2021 Abdelrahman Sobhy. All rights reserved.
//

import UIKit

class LeaugeRouterImpl: LeaugeRouter {
    
    var view: LeaugeView?
    
    static func createModule() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "LeaugeViewController")
        if let viewController = viewController as? LeaugeViewController {
            let interactor = LeaugeInteractor()
            let router = LeaugeRouterImpl()
        let presenter = LeaugePresenterImpl(view: viewController, interactor: interactor, router: router)
            viewController.presenter = presenter
            interactor.presenter = presenter
            router.view = viewController
        }
        return viewController
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Leauge", bundle: nil)
    }
    
    func navigateToDetailsScreen(from view: LeaugeView?, id: String){
        let leagueDetailsViewController = LeaugeDetailsRouterImpl.createLeaugeDetailsModule(id: id)
        if let viewController = view as? UIViewController {
            viewController.present(leagueDetailsViewController, animated: true, completion: nil)
        }
    }
    
}
