//
//  SignupRequest.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/05.
//

import Foundation

struct SignupReqeust: Encodable {
    let email: String
    let nickname: String
    let password: String
}
