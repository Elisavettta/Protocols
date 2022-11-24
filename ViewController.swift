//
//  ViewController.swift
//  Lesson10
//
//  Created by Mac on 18.04.22.
//

import UIKit

class ViewController: UIViewController {
    
    let analogAppDelegate = AnalogAppDelegate()
    let notifications = Notifications()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notifications.changeOption()
    }
}
