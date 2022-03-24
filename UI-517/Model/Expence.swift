//
//  Expence.swift
//  UI-517
//
//  Created by nyannyan0328 on 2022/03/23.
//

import SwiftUI

struct Expence: Identifiable {
    var id = UUID().uuidString
    var icon : String
    var title : String
    var subTitle : String
    var amount : String
}

var expenses: [Expence] = [

    Expence(icon: "Food", title: "Food", subTitle: "K Food Restaurant", amount: "$145.00"),
    Expence(icon: "Taxi", title: "Taxi", subTitle: "Taxi Payment", amount: "$45.90"),
    Expence(icon: "Netflix", title: "Netflix", subTitle: "Subscription", amount: "$22.00"),
]


let months: [String] = ["Jan","Feb","Mar","Apr","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
let progressArray: [CGFloat] = [0.1,0.4,0.9,0.5,0.3,0.8,0.6,0.2,0.89,0.45,0.98,1.00]
