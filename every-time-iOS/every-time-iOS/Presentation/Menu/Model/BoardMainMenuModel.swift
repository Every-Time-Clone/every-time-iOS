//
//  BoardMainMenu.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/15.
//

import UIKit

struct BoardMainMenuModel {
    let menuImageName: String
    let menuName: String
    
    static func dummyData() -> [BoardMainMenuModel] {
        return [BoardMainMenuModel(menuImageName: "", menuName: "내가 쓴 글"),
                BoardMainMenuModel(menuImageName: "", menuName: "댓글 단 글"),
                BoardMainMenuModel(menuImageName: "", menuName: "스크랩"),
                BoardMainMenuModel(menuImageName: "", menuName: "HOT 게시판"),
                BoardMainMenuModel(menuImageName: "", menuName: "Best 게시판"),
        ]
    }
}
