//
//  LeaugeRepo.swift
//  VIPER-Demo
//
//  Created by Abdelrahman Sobhy on 1/3/21.
//  Copyright © 2021 Abdelrahman Sobhy. All rights reserved.
//

import Foundation


class LeaugeRepoImpl {
    func getLeaugeDetails(id: String, completionHandeler: @escaping (Result<LeagueDetails, ErrorHandler>) -> Void) {
        ApiRequest.apiCall(responseModel: LeagueDetails.self, request: .leaguesDetails(id: id)) { response in
            switch response {
            case .success(let leaugeDetails):
                completionHandeler(.success(leaugeDetails))
            case .failure(let error):
                completionHandeler(.failure(error))
            }
        }
    }
    
    func getLeauges(completionHandeler: @escaping (Result<League, ErrorHandler>) -> Void) {
        ApiRequest.apiCall(responseModel: League.self, request: .getLeagues) { response in
            switch response {
            case .success(let leauge):
                completionHandeler(.success(leauge))
            case .failure(let error):
                completionHandeler(.failure(error))
            }
        }
    }
    
}
