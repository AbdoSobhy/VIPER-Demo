//
//  ListViewModel.swift
//  GoalLeaugeSwiftUI
//
//  Created by Abdelrahman Sobhy on 8/28/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
struct LeagueDetails: Codable {
    let leagues: [LeagueData]
}

struct LeagueData: Codable {
    let strLeague: String?
    let strSport: String?
    let strCountry: String?
    let strLogo: String?
    let strDescriptionEN: String?
}

struct LeagueDetailsViewModel {
    let leaugeName: String
    let leaugeDetails: String
    
    init(leagueData: LeagueData) {
        self.leaugeName = leagueData.strLeague ?? ""
        self.leaugeDetails = leagueData.strDescriptionEN ?? ""
    }
}
