//
//  LoginRequest.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/05.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}
