//
//  ListViewModel.swift
//  GoalLeaugeSwiftUI
//
//  Created by Abdelrahman Sobhy on 8/28/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation

struct League: Codable {
    let leagues: [Leagues]
}

class Leagues: Codable {
    var idLeague: String?
    var strLeague : String?
    var strSport: String?
    var strLeagueAlternate: String?
    
}

struct LeaugeViewModel {
    var leaugeName: String
    var leaugeAltirnitiveName: String
    var leaugeSport: String
    init(leagues: Leagues) {
        self.leaugeName = leagues.strLeague ?? ""
        self.leaugeAltirnitiveName = leagues.strLeagueAlternate ?? ""
        self.leaugeSport = leagues.strSport ?? ""
    }
}


