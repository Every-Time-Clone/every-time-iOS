//
//  PostsResponse.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/13.
//

import Foundation

struct PostListResponse: Decodable {
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
        return PostModel(uuid: self.uuid, title: self.title, contents: self.contents, time: self.uploadDate, name: "닉네임", goods: self.goods, commentNumber: "3", scrapNumber: "3", isScrapped: false)
    }
}

struct User: Decodable {
    let uuid, email, nickname: String
}

typealias Posts = [PostListResponse]
