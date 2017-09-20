//
//  AppCoordinator.swift
//  ScaleForce
//
//  Created by Jason Clark on 8/14/17.
//
//

import Foundation

class AppCoordinator {

    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {

        window.rootViewController = UIViewController()
        window.makeKeyAndVisible()

    }

}
