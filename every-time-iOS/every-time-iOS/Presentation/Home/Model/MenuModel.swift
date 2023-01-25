//
//  MenuModel.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/25.
//

import UIKit

struct MenuModel {
    let menuImage: String
    let menuName: String
    
    static func dummyData() -> [MenuModel] {
        return [MenuModel(menuImage: "Menu1", menuName: "학교\n홈"),
                MenuModel(menuImage: "Menu2", menuName: "열람실\n현황"),
                MenuModel(menuImage: "Menu3", menuName: "eClass"),
                MenuModel(menuImage: "Menu4", menuName: "학사\n공지"),
                MenuModel(menuImage: "Menu5", menuName: "학사\n일정"),
                MenuModel(menuImage: "Menu6", menuName: "도서관"),
                MenuModel(menuImage: "Menu7", menuName: "웹메일")]
    }
}
