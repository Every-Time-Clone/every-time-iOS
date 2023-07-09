//
//  UserInfoResponse.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/07/09.
//

import Foundation

struct UserInfoResponse: Decodable {
    let statusCode: Int
    let responseMessage: String
    let data: UserInfo
}

struct UserInfo: Decodable {
    let uuid: String
    let email: String
    let nickname: String
}
