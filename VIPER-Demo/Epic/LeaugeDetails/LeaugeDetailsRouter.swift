//
//  LeaugeDetailsRouter.swift
//  VIPER-Demo
//
//  Created by Abdelrahman Sobhy on 1/4/21.
//  Copyright © 2021 Abdelrahman Sobhy. All rights reserved.
//

import UIKit

class LeaugeDetailsRouterImpl: LeaugeDetailsRouter {
    var view: LeaugeDetailsView?
    
    static func createLeaugeDetailsModule(id: String) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "LeaugeDetailsViewController")
        if let view = viewController as? LeaugeDetailsViewController {
            let interactor = LeaugeDetailsInteractor()
            let router = LeaugeDetailsRouterImpl()
            let presenter = LeaugeDetailsPresenterImpl(view: view, interactor: interactor, router: router, leaugeID: id)
            view.presenter = presenter
            interactor.presenter = presenter
            router.view = view
        }
        return viewController
    }
    
    func showAlert(from view: LeaugeDetailsView?, message: String, completion: ((UIAlertAction) -> Void)?) {
        if let view = view as? UIViewController {
        view.alert(message: message, actions: [("OK", .cancel, completion)])
        }
    }
    
    static var storyboard: UIStoryboard {
       return UIStoryboard(name: "LeaugeDetails", bundle: nil)
    }
}


