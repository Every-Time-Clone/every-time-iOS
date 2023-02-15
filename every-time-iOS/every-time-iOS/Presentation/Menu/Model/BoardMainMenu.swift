//
//  BoardMainMenu.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/15.
//

import UIKit

struct BoardMainMenu {
    let menuImageName: String
    let menuName: String
    
    static func dummyData() -> [BoardMainMenu] {
        return [BoardMainMenu(menuImageName: "", menuName: "내가 쓴 글"),
                BoardMainMenu(menuImageName: "", menuName: "댓글 단 글"),
                BoardMainMenu(menuImageName: "", menuName: "스크랩"),
                BoardMainMenu(menuImageName: "", menuName: "HOT 게시판"),
                BoardMainMenu(menuImageName: "", menuName: "Best 게시판"),
        ]
    }
}
