//
//  APIClient+ScaleForce.swift
//  ScaleForce
//
//  Created by Jay Clark on 7/24/17.
//
//

import Foundation

extension APIClient {

    static var shared = APIClient(baseURL: {
        let baseURL: URL
        switch APIEnvironment.active {
        case .develop:
            baseURL = URL(string: "https://ScaleForce-dev.raizlabs.xyz")!
        case .sprint:
            baseURL = URL(string: "https://ScaleForce-sprint.raizlabs.xyz")!
        case .production:
            fatalError("Specify the release server")
        }
        return baseURL
    }())

}
