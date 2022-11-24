//
//  Doctor.swift
//  Lesson10
//
//  Created by Mac on 18.04.22.
//

import UIKit

class Doctor {
    
var salary = 1200.0
var avaragePrice = 25.0
let notificationCenter = NotificationCenter.default
    
    init () {
        notificationCenter.addObserver(self, selector: #selector(salaryChangeNotification(notification:)), name: .changeGovernmentSalary, object: nil)
        notificationCenter.addObserver(self, selector: #selector(avaragePriceChangeNotification(notification:)), name: .changeGovernmentAveragePrice, object: nil)
        notificationCenter.addObserver(
            self,
            selector: #selector(goToSleep),
            name: UIScene.didEnterBackgroundNotification,
            object: nil
        )
       notificationCenter.addObserver(
            self,
            selector: #selector(wakeUp),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
    }
    
    @objc
    private func salaryChangeNotification(notification: NSNotification) {
        guard let value = notification.userInfo?[Keys.keyGovernmentSalary] as? Double else {
            return
        }
        print("Doctor \(value < salary ? "not satisfied" : "satisfied") change salary")
    }

    @objc
    private func avaragePriceChangeNotification(notification: NSNotification) {
        guard let value = notification.userInfo?[Keys.keyGovernmentAveragePrice] as? Double else {
            return
        }
        print("Doctor \(value < avaragePrice ? "not satisfied" : "satisfied") change avarage price")
        print("\nDoctor \(value * 30 > salary ? "will not be able to pay" : "everything is fine") inflation")
        avaragePrice = value
    }
    
    @objc
    private func goToSleep() {
        print("Doctor go to sleep")
    }
    
    @objc
    private func wakeUp() {
        print("Doctor wake up")
    }
}
