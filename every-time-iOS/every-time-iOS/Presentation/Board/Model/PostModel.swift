//
//  PostModel.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/31.
//

import Foundation

struct PostModel {
    let uuid: String
    let user: UserModel
    let title: String
    let contents: String
    let time: String
    let name: String
    let goods: Int
    let commentNumber: String
    let scrapNumber: String
    let isScrapped: Bool
}

struct UserModel {
    let uuid: String
    let email: String
    let nickname: String
}
