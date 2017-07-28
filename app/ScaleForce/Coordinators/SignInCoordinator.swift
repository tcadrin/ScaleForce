//
//  SignInCoordinator.swift
//  ScaleForce
//
//  Created by Jay Clark on 3/27/17.
//  Copyright © 2017 LongTime. All rights reserved.
//

import UIKit

protocol SignInCoordinatorDelegate: class {

    func didSignIn()

}

class SignInCoordinator: Coordinator {

    let baseController: UIViewController
    var childCoordinator: Coordinator?
    weak var delegate: SignInCoordinatorDelegate?

    init(_ baseController: UIViewController) {
        self.baseController = baseController
    }

    func start(animated: Bool, completion: VoidClosure?) {
        // TODO - create and use SignInViewController
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        self.baseController.present(vc, animated: animated, completion: completion)
    }

    func cleanup(animated: Bool, completion: VoidClosure?) {
        baseController.dismiss(animated: animated, completion: completion)
    }

}
