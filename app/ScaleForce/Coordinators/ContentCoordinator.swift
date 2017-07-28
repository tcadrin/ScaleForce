//
//  ContentCoordinator.swift
//  ScaleForce
//
//  Created by Jay Clark on 3/27/17.
//  Copyright © 2017 LongTime. All rights reserved.
//

import UIKit

class ContentCoordinator: Coordinator {

    let baseController: UIViewController
    var childCoordinator: Coordinator?

    init(_ baseController: UIViewController) {
        self.baseController = baseController
    }

    func start(animated: Bool, completion: VoidClosure?) {
        let vc = ContentTabBarViewController()
        vc.modalTransitionStyle = .crossDissolve
        baseController.present(vc, animated: animated, completion: completion)
    }

    func cleanup(animated: Bool, completion: VoidClosure?) {
        baseController.dismiss(animated: animated, completion: completion)
    }

}
