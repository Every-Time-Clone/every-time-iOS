//
//  FavoriteBoard.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/25.
//

import Foundation

struct FavoriteBoard {
    let boardTitle: String
    let contentTitle: String
    
    static func dummyData() -> [FavoriteBoard] {
        return [FavoriteBoard(boardTitle: "자유게시판", contentTitle: "국제경제학"),
                FavoriteBoard(boardTitle: "졸업생게시판", contentTitle: "중소기업 대기업"),
                FavoriteBoard(boardTitle: "새내기게시판", contentTitle: "입학식 꼭 가야 하나요?")]
    }
}
