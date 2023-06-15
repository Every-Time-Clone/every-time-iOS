//
//  RegisterPostRequest.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/15.
//

import Foundation

struct RegisterPostRequest: Encodable {
    let title: String
    let contents: String
}
