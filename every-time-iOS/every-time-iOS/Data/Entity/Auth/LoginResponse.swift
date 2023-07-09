//
//  LoginResponseModel.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/05.
//

import Foundation

struct LoginResponse: Decodable {
    let statusCode: Int
    let responseMessage: String
    let data: String
}
