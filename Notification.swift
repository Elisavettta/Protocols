//
//  Notification.swift
//  Lesson10
//
//  Created by Mac on 18.04.22.
//

import Foundation

class Notifications {

    let government = Government()
    let doctor = Doctor()
    let businessman = Businessman()
    let pensioner = Pensioner()

    func changeOption() {
        print("Change taxLevel")
        government.taxtLevel = 4.0
        print("Change salary")
        government.salary = 1300.0
        print("Change pension")
        government.pension = 950.0
        print("Change average price")
        government.averagePrice = 18.0
    }
}
