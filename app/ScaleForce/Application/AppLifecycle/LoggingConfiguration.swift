//
//  LoggingConfiguration.swift
//  ScaleForce
//
//  Created by Jay Clark on 11/1/16.
//  Copyright © 2017 LongTime. All rights reserved.
//

import UIKit
import Swiftilities

struct LoggingConfiguration: AppLifecycle {

    func onDidLaunch(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        Log.logLevel = .info
        NetworkLog.logLevel = .info
    }

}
