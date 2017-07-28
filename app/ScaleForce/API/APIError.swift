//
//  APIError.swift
//  ScaleForce
//
//  Created by Jay Clark on 11/1/16.
//  Copyright © 2017 LongTime. All rights reserved.
//

enum APIError: Error {
    case tokenExpired
    case invalidCredentials
    case invalidResponse
    case server
}
