//
//  Pensioner.swift
//  Lesson10
//
//  Created by Mac on 18.04.22.
//

import UIKit

class Pensioner {
    
    var salary = 800.0
    var avaragePrice = 14.0
    let notificationCenter = NotificationCenter.default
    
    init () {
        notificationCenter.addObserver(self, selector: #selector(pensionerChangedNotification(notification:)), name: .changeGovernmentPension, object: nil)
        notificationCenter.addObserver(self, selector: #selector(avaragePriceChangeNotification(notification:)), name: .changeGovernmentAveragePrice, object: nil)
        notificationCenter.addObserver(
            self,
            selector: #selector(goToSleep),
            name: UIApplication.didEnterBackgroundNotification,
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
    private func pensionerChangedNotification(notification: NSNotification) {
        guard let value = notification.userInfo?[Keys.keyGovernmentPension] as? Double else {
            return
        }
        print("Pensioner \(value < salary ? "not satisfied" : "satisfied")change salary")
    }
    
    @objc
    private func avaragePriceChangeNotification(notification: NSNotification) {
        guard let value = notification.userInfo?[Keys.keyGovernmentAveragePrice] as? Double else {
            return
        }
        print("Pensioner \(value < avaragePrice ? "not satisfied" : "satisfied") change avarage price")
        print("Pensioner \(value * 30 > salary ? "will not be able to pay" : "everything is fine") inflation")
        avaragePrice = value
    }
    
    @objc
    private func goToSleep() {
        print("Pensioner go to sleep")
    }
    
    @objc
    private func wakeUp() {
        print("Pensioner wake up")
    }
}
