//
//  Businessman.swift
//  Lesson10
//
//  Created by Mac on 18.04.22.
//

import UIKit

class Businessman {

    var taxLevel = 3.0
    var averagePrice = 20.0
    let notificationCenter = NotificationCenter.default
    var profit = 3500.0

    init() {
        notificationCenter.addObserver(
            self,
            selector: #selector(taxLevelChangedNotification(notification: )),
            name: .changeGovernmentTaxtLevel,
            object: nil
        )
        notificationCenter.addObserver(
            self,
            selector: #selector(averagePriceChangedNotification(notification: )),
            name: .changeGovernmentAveragePrice,
            object: nil
        )
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
    private func taxLevelChangedNotification(notification: NSNotification) {
        guard let value = notification.userInfo?[Keys.keyGovernmentTaxtLevel] as? Double else {
            return
        }
        print("Businessman \(value < taxLevel ? "not satisfied" : "satisfied") change tax level")
    }

    @objc
    private func averagePriceChangedNotification(notification: NSNotification) {
        guard let value = notification.userInfo?[Keys.keyGovernmentAveragePrice] as? Double else {
            return
        }
        print("Businessman \(value < averagePrice ? "not satisfied" : "satisfied") (change average price)")
        print("Businessman \(value * 30 > profit - (profit * taxLevel / 100) ? "will not be able to pay" : "everything is fine") inflation\n")
        averagePrice = value
    }
    
    @objc
    private func goToSleep() {
        print("Businessman go to sleep")
    }
    
    @objc
    private func wakeUp() {
        print("Businessman wake up")
    }
}
