//
//  AppDelegate.swift
//  DemoDelegate
//
//  Created by MBP0020 on 4/17/19.
//  Copyright © 2019 truongnv15. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let homeVC = HomeViewController()
        window?.rootViewController = homeVC
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }
}

