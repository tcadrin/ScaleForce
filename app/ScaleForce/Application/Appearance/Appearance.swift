//
//  Appearance.swift
//  ScaleForce
//
//  Created by Jay Clark on 11/1/16.
//  Copyright © 2017 LongTime. All rights reserved.
//

import UIKit

struct Appearance {
    static var shared = Appearance()

    func style() {
        // Configure UIAppearance proxies
    }
}

extension Appearance: AppLifecycle {
    func onDidLaunch(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        style()
    }
}
