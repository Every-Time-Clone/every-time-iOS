//
//  SignupResponse.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/05.
//

import Foundation

struct SignupResponse: Decodable {
    let statusCode: Int
    let responseMessage: String
    let data: Data
}

struct Data: Decodable {
    let uuid: String
    let email: String
    let nickname: String
}
