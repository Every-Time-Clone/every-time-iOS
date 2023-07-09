//
//  UserPostsResponse.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/07/08.
//

import Foundation

struct UserPostsResponse: Decodable {
    let statusCode: Int
    let responseMessage: String
    let data: [UserPosts]
}

struct UserPosts: Decodable {
    let uuid, title, contents: String
    let goods: Int
    let uploadDate: String

    enum CodingKeys: String, CodingKey {
        case uuid, title, contents, goods
        case uploadDate = "upload_date"
    }

    func convertToUserPost() -> UserPostModel {
        return UserPostModel(uuid: self.uuid,
                             title: self.title,
                             contents: self.contents,
                             goods: self.goods,
                             uploadDate: self.uploadDate)
    }
}
