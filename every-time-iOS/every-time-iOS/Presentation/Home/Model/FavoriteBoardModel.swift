//
//  FavoriteBoard.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/25.
//

import Foundation

struct FavoriteBoardModel {
    let boardTitle: String
    let contentTitle: String
    
    static func dummyData() -> [FavoriteBoardModel] {
        return [FavoriteBoardModel(boardTitle: "자유게시판", contentTitle: "국제경제학"),
                FavoriteBoardModel(boardTitle: "졸업생게시판", contentTitle: "중소기업 대기업"),
                FavoriteBoardModel(boardTitle: "새내기게시판", contentTitle: "입학식 꼭 가야 하나요?")]
    }
}
