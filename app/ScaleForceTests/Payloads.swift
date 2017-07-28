//
//  Payloads.swift
//  ScaleForce
//
//  Created by Jay Clark on 11/3/16.
//  Copyright © 2017 LongTime. All rights reserved.
//

import Foundation
@testable import ScaleForce

enum Payloads {
    static let oauth: Data = {
        let json = [
            "refreshToken": "FAKE_REFRESH_TOKEN",
            "token": "FAKE_TOKEN",
            "expirationDate": Formatters.ISODateFormatter.string(from: Date.distantFuture),
        ]
        do {
            return try JSONSerialization.data(withJSONObject: json)
        }
        catch {
            return Data()
        }
    }()

    static let test: Data = {
        let json = [
            [
                "value": "FAKE_VALUE",
            ],
        ]
        do {
            return try JSONSerialization.data(withJSONObject: json)
        }
        catch {
            return Data()
        }
    }()

}
