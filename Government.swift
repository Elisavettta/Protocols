//
//  Government.swift
//  Lesson10
//
//  Created by Mac on 18.04.22.
//

import Foundation

class Government {
    
    var _taxLevel = 5.0
    var _salary = 1000.0
    var _pension = 20.0
    var _averagePrice = 10.0
    
    var taxtLevel: Double {
        
        get {
            return _taxLevel
        }
        set(newTaxtLavel) {
            _taxLevel = newTaxtLavel
            NotificationCenter.default.post(name: .changeGovernmentTaxtLevel, object: nil, userInfo: [Keys.keyGovernmentTaxtLevel: newTaxtLavel])
        }
    }
    var pension: Double {
        get {
            return _pension
        }
        set(newPension) {
            _pension = newPension
            NotificationCenter.default.post(name: .changeGovernmentPension, object: nil, userInfo: [Keys.keyGovernmentPension: newPension])
        }
    }
    var salary: Double {
        get {
            return _salary
        }
        set(newSalary) {
            _salary = newSalary
            NotificationCenter.default.post(name: .changeGovernmentSalary, object: nil, userInfo: [Keys.keyGovernmentSalary: newSalary])
        }
    }
    var averagePrice: Double {
        get {
            return _averagePrice
        }
        set(newAveragePrice) {
            _averagePrice = newAveragePrice
            NotificationCenter.default.post(name: .changeGovernmentAveragePrice, object: nil, userInfo: [Keys.keyGovernmentAveragePrice: newAveragePrice])
        }
    }
}
