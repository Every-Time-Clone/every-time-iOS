//
//  DeletePostResponse.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/07/02.
//

import Foundation

struct DeletePostResponse: Decodable {
    let statusCode: Int
    let responseMessage: String
    let data: String
}
