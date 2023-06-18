//
//  PostsResponse.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/13.
//

import Foundation

struct PostInfo: Decodable {
    let uuid: String
    let title: String
    let contents: String
    let goods: Int
    let uploadDate: String

    enum CodingKeys: String, CodingKey {
        case uuid, title, contents, goods
        case uploadDate = "upload_date"
    }

    func convertToPost() -> PostModel {
        return PostModel(uuid: self.uuid, title: self.title, contents: self.contents, time: self.uploadDate, name: "닉네임", goods: self.goods, commentNumber: "3", scrapNumber: "3", isScrapped: false)
    }
}

typealias Posts = [PostInfo]
