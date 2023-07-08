//
//  PostsResponse.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/13.
//

import Foundation

struct PostDetailResponse: Decodable {
    let uuid: String
    let user: User
    let title: String
    let contents: String
    let goods: Int
    let uploadDate: String

    enum CodingKeys: String, CodingKey {
        case uuid, user, title, contents, goods
        case uploadDate = "upload_date"
    }

    func convertToPost() -> PostModel {
        return PostModel(uuid: self.uuid,
                         user: UserModel(uuid: self.user.uuid, email: self.user.email, nickname: self.user.nickname),
                         title: self.title,
                         contents: self.contents,
                         time: self.uploadDate,
                         name: self.user.nickname,
                         goods: self.goods,
                         commentNumber: "0",
                         scrapNumber: "3",
                         isScrapped: false)
    }
}

struct User: Decodable {
    let uuid, email, nickname: String
}

typealias Posts = [PostDetailResponse]
