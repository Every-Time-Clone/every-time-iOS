//
//  ModifyPostResponse.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/18.
//

import Foundation

struct ModifyPostResponse: Decodable {
    let statusCode: Int
    let responseMessage: String
    let data: PostInfo
}

